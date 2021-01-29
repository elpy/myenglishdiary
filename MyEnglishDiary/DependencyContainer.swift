//
//  DependencyContainer.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 11.12.2020.
//

import Foundation

class DependencyContainer {
    static let shared = DependencyContainer()

    // MARK: data providers

    private var dictionaryDataProvider: DictionaryDataProvider = RealmDictionaryDataProvider()
    // private var dictionaryDataProvider: DictionaryDataProvider = DevelopmentDictionaryDataProvider()
    private var diaryDataProvider: DiaryDataProvider = DevelopmentDiaryDataProvider()

    // MARK: services

    private let loggingServer: LoggingService = LoggingService()

    init() {

    }

    // MARK: use cases

    func makeSearchUseCase(for text: String) -> SearchUseCase {
        return SearchUseCase(for: text, dictionaryDataProvider)
    }

    func makeReadNotesUseCase() -> ReadNotesUseCase {
        return ReadNotesUseCase(diaryDataProvider)
    }

    func makeReadGroupsUseCase() -> ReadGroupsUseCase {
        return ReadGroupsUseCase(diaryDataProvider)
    }

    func makeMakeNoteUseCase(from lexeme: Lexeme, in group: NotesGroup? = nil) -> MakeNoteUseCase {
        return MakeNoteUseCase(from: lexeme, in: group, diaryDataProvider)
    }
}
