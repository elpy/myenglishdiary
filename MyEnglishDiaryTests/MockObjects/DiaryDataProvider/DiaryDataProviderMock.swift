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

    var notesAdded: [DiaryRecord] = []
    var groupsAdded: [DiaryRecordsGroup] = []
    var notes: [DiaryRecord] = [
        DiaryRecord(
            lexeme: Lexeme(
                language: Language.English,
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
    var groups: [DiaryRecordsGroup] = [
        DiaryRecordsGroup(name: "Any value")
    ]
    var notesMarked: [DiaryRecord] = []

    // MARK: mock methods

    func addNewRecord(_ note: DiaryRecord, _ completion: @escaping (Result<Void, Error>) -> Void) {
        notesAdded.append(note)
        completion(.success(()))
    }

    func addNewGroup(_ group: DiaryRecordsGroup, _ completion: @escaping (Result<Void, Error>) -> Void) {
        groupsAdded.append(group)
        completion(.success(()))
    }

    func getRecords(_ completion: @escaping (Result<[DiaryRecord], Error>) -> Void) {
        completion(.success(notes))
    }

    func getGroups(_ completion: @escaping (Result<[DiaryRecordsGroup], Error>) -> Void) {
        completion(.success(groups))
    }

    func markNote(_ note: DiaryRecord, with tag: TranslationTag, _ completion: @escaping (Result<Void, Error>) -> Void) {
        var tags: [TranslationTag] = note.studyingLog
        tags.append(tag)

        let newNote = DiaryRecord(
            lexeme: note.lexeme,
            group: note.group,
            date: note.date,
            tags: tags
        )

        notesMarked.append(newNote)
        completion(.success(()))
    }
}
