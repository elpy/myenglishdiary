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

//    private var dictionaryDataProvider: DictionaryDataProvider = DevelopmentDictionaryDataProvider()
    private var dictionaryDataProvider: DictionaryDataProvider = AmplifyDictionaryDataProvider()
    private var diaryDataProvider: DiaryDataProvider = DevelopmentDiaryDataProvider()

    // MARK: services

    private let loggingService: LoggingService = LoggingService()
    private let amplifyService: AmplifyService = AmplifyService()

    init() {

    }

    // MARK: use cases

    func makeSearchUseCase(for text: String) -> SearchUseCase {
        return SearchUseCase(for: text, dictionaryDataProvider)
    }

    func makeReadDiaryRecordsUseCase() -> ReadDiaryRecordsUseCase {
        return ReadDiaryRecordsUseCase(diaryDataProvider)
    }

    func makeReadRecordsGroupsUseCase() -> ReadRecordsGroupsUseCase {
        return ReadRecordsGroupsUseCase(diaryDataProvider)
    }

    func makeMakeDiaryRecordUseCase(from lexeme: Lexeme, in group: DiaryRecordsGroup? = nil) -> MakeDiaryRecordUseCase {
        return MakeDiaryRecordUseCase(from: lexeme, in: group, diaryDataProvider)
    }
}
