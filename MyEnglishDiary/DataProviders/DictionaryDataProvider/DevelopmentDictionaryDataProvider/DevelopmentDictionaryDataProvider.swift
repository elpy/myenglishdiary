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
            lexeme: "lounge",
            partOfSpeech: PartOfSpeech.NOUN,
            transcription: "laʊnʤ",
            meanings: [
                Meaning(
                    meaning: "гостиная",
                    lexemesWithSimilarMeaning: ["hall", "lobby", "waiting room"],
                    examples: [
                        Example(
                            example: "comfortable lounge",
                            meaning: "уютный холл"
                        ),
                        Example(
                            example: "cocktail lounge",
                            meaning: "коктейльный зал"
                        )
                    ]
                ),
                Meaning(
                    meaning: "комната отдыха",
                    lexemesWithSimilarMeaning: ["rest room"],
                    examples: []
                ),
                Meaning(
                    meaning: "шезлонг",
                    lexemesWithSimilarMeaning: ["chaise", "sun bed"],
                    examples: []
                ),
                Meaning(
                    meaning: "буфет",
                    lexemesWithSimilarMeaning: ["buffet", "bar"],
                    examples: []
                ),
                Meaning(
                    meaning: "салон",
                    lexemesWithSimilarMeaning: ["salon"],
                    examples: []
                ),
                Meaning(
                    meaning: "лаунжа",
                    lexemesWithSimilarMeaning: [],
                    examples: []
                )
            ]
        ),
        Lexeme(
            language: Language.ENG,
            lexeme: "lounge",
            partOfSpeech: PartOfSpeech.VERB,
            transcription: "laʊnʤ",
            meanings: [
                Meaning(
                    meaning: "бездельничать",
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
