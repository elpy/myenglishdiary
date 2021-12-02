//
//  DevelopmentDiaryDataProvider.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 20.01.2021.
//

import Foundation

final class DevelopmentDiaryDataProvider: DiaryDataProvider {
    func addNewRecord(_ note: DiaryRecord, _ completion: @escaping (Result<Void, Error>) -> Void) {
        notes.append(note)
        completion(.success(()))
    }

    func addNewGroup(_ group: DiaryRecordsGroup, _ completion: @escaping (Result<Void, Error>) -> Void) {
        groups.append(group)
        completion(.success(()))
    }

    func getRecords(_ completion: @escaping (Result<[DiaryRecord], Error>) -> Void) {
        completion(.success(notes))
    }

    func getGroups(_ completion: @escaping (Result<[DiaryRecordsGroup], Error>) -> Void) {
        completion(.success(groups))
    }

    func markNote(_ note: DiaryRecord, with tag: TranslationTag, _ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.success(()))
    }
}

fileprivate var notes = [
    DiaryRecord(
        id: UUID().uuidString,
        lexeme: Lexeme(
            id: "LEXEME_1",
            language: Language.english,
            text: "lounge",
            partOfSpeech: PartOfSpeech.VERB,
            transcription: ["laʊnʤ"],
            forms: [],
            translations: [
                LexemeTranslation(
                    id: "TRANSLATION_1",
                    text: "бездельничать",
                    tip: nil,
                    examples: [],
                    tags: []
                )
            ],
            lessCommonTranslations: []
        ),
        group: nil,
        date: Date(),
        studyingLog: []
    )
]

fileprivate var groups = [
    DiaryRecordsGroup(id: UUID().uuidString, name: "First group"),
    DiaryRecordsGroup(id: UUID().uuidString, name: "Sun and moon")
]
