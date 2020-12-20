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
    var groupsAdded: [Group] = []
    var notes: [Note] = [
        Note(
            group: nil,
            date: Date(),
            language: Language.ENG,
            lexeme: "any value",
            partOfSpeech: PartOfSpeech.ADVERB,
            transcription: "any value",
            meanings: [],
            tags: []
        )
    ]
    var groups: [Group] = [
        Group(name: "Any value")
    ]
    var notesMarked: [Note] = []

    // MARK: mock methods

    func addNewNote(_ note: Note) throws {
        notesAdded.append(note)
    }

    func addNewGroup(_ group: Group) throws {
        groupsAdded.append(group)
    }

    func getNotes() throws -> [Note] {
        return notes
    }

    func getGroups() throws -> [Group] {
        return groups
    }

    func markNote(_ note: Note, with tag: Tag) throws {
        let newNote = Note(
            group: note.group,
            date: note.date,
            language: note.language,
            lexeme: note.lexeme,
            partOfSpeech: note.partOfSpeech,
            transcription: note.transcription,
            meanings: note.meanings ,
            tags: [tag]
        )

        notesMarked.append(newNote)
    }
}
