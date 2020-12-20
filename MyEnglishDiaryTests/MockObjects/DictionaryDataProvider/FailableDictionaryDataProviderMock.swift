//
//  FailingDictionaryDataProvider.swift
//  MyEnglishDiaryTests
//
//  Created by Антон Скворцов on 19.12.2020.
//

import XCTest
@testable import MyEnglishDiary

final class FailableDictionaryDataProviderMock: DictionaryDataProvider {

    func search(for text: String) throws -> [Lexeme] {
        throw DataProviderError.error
    }
}
