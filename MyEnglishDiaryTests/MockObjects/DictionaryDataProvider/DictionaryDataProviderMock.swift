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
            text: "Mock",
            partOfSpeech: PartOfSpeech.NOUN,
            transcription: "Mock",
            meanings: [
                Meaning(
                    text: "Mock",
                    lexemesWithSimilarMeaning: [],
                    examples: []
                )
            ]
        )
    ]

    func search(for text: String, _ completion: @escaping (Result<DictionarySearchResult, Error>) -> Void) {
        completion(.success(searchResult))
    }
}
