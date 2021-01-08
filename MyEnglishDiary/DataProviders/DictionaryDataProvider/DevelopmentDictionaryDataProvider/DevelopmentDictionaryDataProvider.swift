//
//  DevelopmentDictionaryDataProvider.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 20.12.2020.
//

import Foundation

final class DevelopmentDictionaryDataProvider: DictionaryDataProvider {
    let searchResult = [
        Lexeme(
            language: Language.ENG,
            text: "lounge",
            partOfSpeech: PartOfSpeech.NOUN,
            transcription: "laʊnʤ",
            meanings: [
                Meaning(
                    text: "гостиная",
                    lexemesWithSimilarMeaning: ["hall", "lobby", "waiting room"],
                    examples: [
                        Example(
                            text: "comfortable lounge",
                            meaning: "уютный холл"
                        ),
                        Example(
                            text: "cocktail lounge",
                            meaning: "коктейльный зал"
                        )
                    ]
                ),
                Meaning(
                    text: "комната отдыха",
                    lexemesWithSimilarMeaning: ["rest room"],
                    examples: []
                ),
                Meaning(
                    text: "шезлонг",
                    lexemesWithSimilarMeaning: ["chaise", "sun bed"],
                    examples: []
                ),
                Meaning(
                    text: "буфет",
                    lexemesWithSimilarMeaning: ["buffet", "bar"],
                    examples: []
                ),
                Meaning(
                    text: "салон",
                    lexemesWithSimilarMeaning: ["salon"],
                    examples: []
                ),
                Meaning(
                    text: "лаунжа",
                    lexemesWithSimilarMeaning: [],
                    examples: []
                )
            ]
        ),
        Lexeme(
            language: Language.ENG,
            text: "lounge",
            partOfSpeech: PartOfSpeech.VERB,
            transcription: "laʊnʤ",
            meanings: [
                Meaning(
                    text: "бездельничать",
                    lexemesWithSimilarMeaning: ["sit"],
                    examples: []
                )
            ]
        )
    ]

    func search(for text: String) throws -> [Lexeme] {
        return searchResult
    }
}
