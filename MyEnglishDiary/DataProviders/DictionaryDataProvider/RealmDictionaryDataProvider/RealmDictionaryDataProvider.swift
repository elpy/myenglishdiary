//
//  RealmDictionaryDataProvider.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 15.01.2021.
//

import Foundation
import RealmSwift

final class RealmDictionaryDataProvider: DictionaryDataProvider {
    private let realmAppId: String
    private let realmServiceName: String
    private let realmDatabaseName: String
    private var mongoClient: MongoClient?

    init() {
        if
            case .option(let appId) = Configuration.realmDictionaryProviderAppId,
            case .option(let serviceName) = Configuration.realmMongoDBServiceName,
            case .option(let databaseName) = Configuration.realmDictionaryDatabaseName
        {
            realmAppId = appId
            realmServiceName = serviceName
            realmDatabaseName = databaseName
            authenticate()
        } else {
            fatalError("Invalid Realm Configuration in Info.plist")
        }
    }

    func authenticate() {
        let app = App(id: realmAppId)
        app.login(credentials: Credentials.anonymous) { result in
            switch result {
            case .failure(let error):
                print("Login failed: \(error)")
            case .success(let user):
                print("Login as \(user) succeeded!")
                self.mongoClient = app.currentUser?.mongoClient(self.realmServiceName)
            }
        }
    }

    func search(for text: String, _ completion: @escaping (Result<DictionarySearchResult, Error>) -> Void) {
        guard let client = mongoClient else {
            completion(.failure(DataProviderError.authRequired))
            return
        }

        let database = client.database(named: realmDatabaseName)
        let collection = database.collection(withName: "eng-rus")

        // TODO: move to a server side
        collection.aggregate(pipeline: [
            ["$match": AnyBSON(dictionaryLiteral: ("text", AnyBSON(dictionaryLiteral: ("$regex", AnyBSON(stringLiteral: "^\(text)")))))],
            ["$sort": AnyBSON(dictionaryLiteral: ("text", AnyBSON(integerLiteral: 1)))],
            ["$limit": AnyBSON(integerLiteral: 20)]
        ]) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
                print("Call to MongoDB failed: \(error.localizedDescription)")

            case .success(let documents):
                do {
                    let lexemes: [Lexeme] = try documents.map { document in
                        try document.decodeLexeme()
                    }

                    completion(.success(lexemes))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}

// MARK: Document extensions

// TODO: make it beautiful somehow
extension Document {
    func decodeLexeme() throws -> Lexeme {
        let errorText = "Parsing error"

        guard let languageString = self["language"]??.stringValue, let language = Language(rawValue: languageString) else {
            throw NSError(domain: errorText, code: 0, userInfo: ["field": "language"])
        }

        guard let text = self["text"]??.stringValue else {
            throw NSError(domain: errorText, code: 0, userInfo: ["field": "text"])
        }

        guard let transcription = self["transcription"]??.stringValue else {
            throw NSError(domain: errorText, code: 0, userInfo: ["field": "transcription"])
        }

        guard let partOfSpeech = self["partOfSpeech"]??.stringValue else {
            throw NSError(domain: errorText, code: 0, userInfo: ["field": "partOfSpeech"])
        }

        guard let meaningsArray = self["meanings"]??.arrayValue else {
            throw NSError(domain: errorText, code: 0, userInfo: ["field": "meanings"])
        }

        let meanings: [Meaning] = try meaningsArray.map { meaningObject in
            guard let text = meaningObject?.documentValue?["text"]??.stringValue else {
                throw NSError(domain: errorText, code: 0, userInfo: ["field": "meanings->text"])
            }

            guard let lexemesWithSimilarMeaningArray = meaningObject?.documentValue?["lexemesWithSimilarMeaning"]??.arrayValue else {
                throw NSError(domain: errorText, code: 0, userInfo: ["field": "meanings->lexemesWithSimilarMeaning"])
            }

            let lexemesWithSimilarMeaning: [String] = lexemesWithSimilarMeaningArray.map { object in
                object?.stringValue ?? ""
            }

            guard let examplesArray = meaningObject?.documentValue?["examples"]??.arrayValue else {
                throw NSError(domain: errorText, code: 0, userInfo: ["field": "meanings->examples"])
            }

            let examples: [Example] = try examplesArray.map { exampleObject in
                guard let text = exampleObject?.documentValue?["text"]??.stringValue else {
                    throw NSError(domain: errorText, code: 0, userInfo: ["field": "meanings->examples->text"])
                }

                guard let meaning = exampleObject?.documentValue?["meaning"]??.stringValue else {
                    throw NSError(domain: errorText, code: 0, userInfo: ["field": "meanings->examples->meaning"])
                }

                let example = Example(
                    text: text,
                    meaning: meaning
                )

                return example
            }

            let meaning = Meaning(
                text: text,
                lexemesWithSimilarMeaning: lexemesWithSimilarMeaning,
                examples: examples
            )

            return meaning
        }

        let lexeme = Lexeme(
            language: language,
            text: text,
            partOfSpeech: PartOfSpeech(rawValue: partOfSpeech),
            transcription: transcription.isEmpty ? nil : transcription,
            meanings: meanings
        )

        return lexeme
    }
}
