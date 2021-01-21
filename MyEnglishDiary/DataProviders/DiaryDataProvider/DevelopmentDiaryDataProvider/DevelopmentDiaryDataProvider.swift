//
//  DevelopmentDiaryDataProvider.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 20.01.2021.
//

import Foundation

final class DevelopmentDiaryDataProvider: DiaryDataProvider {
    func addNewNote(_ note: Note, _ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.success(()))
    }

    func addNewGroup(_ group: Group, _ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.success(()))
    }

    func getNotes(_ completion: @escaping (Result<[Note], Error>) -> Void) {
        completion(.success(notes))
    }

    func getGroups(_ completion: @escaping (Result<[Group], Error>) -> Void) {
        completion(.success(groups))
    }

    func markNote(_ note: Note, with tag: Tag, _ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.success(()))
    }
}

fileprivate let notes = [
    Note(
        group: nil,
        date: Date(),
        language: Language.ENG,
        text: "Dev string",
        partOfSpeech: PartOfSpeech.NOUN,
        transcription: nil,
        meanings: [
            Meaning(
                text: "Dev meaning",
                lexemesWithSimilarMeaning: [],
                examples: [])
        ],
        tags: []
    ),
    Note(
        group: nil,
        date: Date(),
        language: Language.ENG,
        text: "Dev string2",
        partOfSpeech: PartOfSpeech.NOUN,
        transcription: nil,
        meanings: [
            Meaning(
                text: "Dev meaning2",
                lexemesWithSimilarMeaning: [],
                examples: [])
        ],
        tags: []
    ),
    Note(
        group: groups.first,
        date: Date().addingTimeInterval(TimeInterval(-1000000000)),
        language: Language.ENG,
        text: "Dev string3",
        partOfSpeech: PartOfSpeech.NOUN,
        transcription: nil,
        meanings: [
            Meaning(
                text: "Dev meaning3",
                lexemesWithSimilarMeaning: [],
                examples: [])
        ],
        tags: []
    )
]

fileprivate let groups = [
    Group(name: "First group"),
    Group(name: "Sun and moon")
]
