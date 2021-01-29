//
//  DiaryDataProviderMock.swift
//  MyEnglishDiaryTests
//
//  Created by Антон Скворцов on 20.12.2020.
//

import XCTest
@testable import MyEnglishDiary

final class DiaryDataProviderMock: DiaryDataProvider {
    // MARK: test helpers

    var notesAdded: [Note] = []
    var groupsAdded: [NotesGroup] = []
    var notes: [Note] = [
        Note(
            lexeme: Lexeme(
                language: Language.ENG,
                text: "any value",
                partOfSpeech: PartOfSpeech.ADVERB,
                transcription: "any value",
                meanings: []
            ),
            group: nil,
            date: Date(),
            tags: []
        )
    ]
    var groups: [NotesGroup] = [
        NotesGroup(name: "Any value")
    ]
    var notesMarked: [Note] = []

    // MARK: mock methods

    func addNewNote(_ note: Note, _ completion: @escaping (Result<Void, Error>) -> Void) {
        notesAdded.append(note)
        completion(.success(()))
    }

    func addNewGroup(_ group: NotesGroup, _ completion: @escaping (Result<Void, Error>) -> Void) {
        groupsAdded.append(group)
        completion(.success(()))
    }

    func getNotes(_ completion: @escaping (Result<[Note], Error>) -> Void) {
        completion(.success(notes))
    }

    func getGroups(_ completion: @escaping (Result<[NotesGroup], Error>) -> Void) {
        completion(.success(groups))
    }

    func markNote(_ note: Note, with tag: Tag, _ completion: @escaping (Result<Void, Error>) -> Void) {
        var tags: [Tag] = note.tags
        tags.append(tag)

        let newNote = Note(
            lexeme: note.lexeme,
            group: note.group,
            date: note.date,
            tags: tags
        )

        notesMarked.append(newNote)
        completion(.success(()))
    }
}
