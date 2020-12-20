//
//  TestDictionaryDataProvider.swift
//  MyEnglishDiaryTests
//
//  Created by Антон Скворцов on 19.12.2020.
//

import XCTest
@testable import MyEnglishDiary

final class DictionaryDataProviderMock: DictionaryDataProvider {

    let searchResult = [
        Lexeme(
            language: Language.ENG,
            lexeme: "Mock",
            partOfSpeech: PartOfSpeech.NOUN,
            transcription: "Mock",
            meanings: [
                Meaning(
                    meaning: "Mock",
                    lexemesWithSimilarMeaning: [],
                    examples: []
                )
            ]
        )
    ]

    func search(for text: String) throws -> [Lexeme] {
        return searchResult
    }
}
