//
//  DevelopmentDiaryDataProvider.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 20.01.2021.
//

import Foundation

final class DevelopmentDiaryDataProvider: DiaryDataProvider {
    func addNewNote(_ note: Note, _ completion: @escaping (Result<Void, Error>) -> Void) {
        notes.append(note)
        completion(.success(()))
    }

    func addNewGroup(_ group: NotesGroup, _ completion: @escaping (Result<Void, Error>) -> Void) {
        groups.append(group)
        completion(.success(()))
    }

    func getNotes(_ completion: @escaping (Result<[Note], Error>) -> Void) {
        completion(.success(notes))
    }

    func getGroups(_ completion: @escaping (Result<[NotesGroup], Error>) -> Void) {
        completion(.success(groups))
    }

    func markNote(_ note: Note, with tag: Tag, _ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.success(()))
    }
}

fileprivate var notes = [
    Note(
        lexeme: Lexeme(
            language: Language.ENG,
            text: "left",
            partOfSpeech: PartOfSpeech.ADJECTIVE,
            transcription: nil,
            meanings: [
                Meaning(
                    text: "Dev meaning",
                    lexemesWithSimilarMeaning: [],
                    examples: [])
            ]
        ),
        group: nil,
        date: Date(),
        tags: []
    )
]

fileprivate var groups = [
    NotesGroup(name: "First group"),
    NotesGroup(name: "Sun and moon")
]
