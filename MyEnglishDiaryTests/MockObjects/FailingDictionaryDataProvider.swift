//
//  FailingDictionaryDataProvider.swift
//  MyEnglishDiaryTests
//
//  Created by Антон Скворцов on 19.12.2020.
//

import Foundation

class FailingDictionaryDataProvider: DictionaryDataProvider {

    func search(for text: String) throws -> [Lexeme] {
        throw DataProviderError.error
    }
}
