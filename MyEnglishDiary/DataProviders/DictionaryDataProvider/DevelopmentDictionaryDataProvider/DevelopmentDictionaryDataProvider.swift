//
//  DevelopmentDictionaryDataProvider.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 20.12.2020.
//

import Foundation

final class DevelopmentDictionaryDataProvider: DictionaryDataProvider {
    func search(for text: String, _ completion: (Result<DictionarySearchResult, Error>) -> Void) {
        completion(.success(developmentLexemesSet))
    }
}

let developmentLexemesSet = [
    Lexeme(
        id: "LEXEME_1",
        language: Language.english,
        text: "lounge",
        partOfSpeech: PartOfSpeech.NOUN,
        transcription: ["laʊnʤ"],
        forms: [],
        translations: [
            LexemeTranslation(
                id: "TRANSLATION_1",
                text: "гостиная",
                tip: nil,
                examples: [
                    TranslationExample(
                        id: "EXAMPLE_1",
                        text: "comfortable lounge",
                        translation: "уютный холл"
                    ),
                    TranslationExample(
                        id: "EXAMPLE_2",
                        text: "cocktail lounge",
                        translation: "коктейльный зал"
                    )
                ],
                tags: []
            ),
            LexemeTranslation(
                id: "TRANSLATION_2",
                text: "комната отдыха",
                tip: nil,
                examples: [],
                tags: []
            ),
            LexemeTranslation(
                id: "TRANSLATION_3",
                text: "шезлонг",
                tip: nil,
                examples: [],
                tags: []
            ),
            LexemeTranslation(
                id: "TRANSLATION_4",
                text: "буфет",
                tip: nil,
                examples: [],
                tags: []
            ),
            LexemeTranslation(
                id: "TRANSLATION_5",
                text: "салон",
                tip: nil,
                examples: [],
                tags: []
            ),
            LexemeTranslation(
                id: "TRANSLATION_6",
                text: "лаунжа",
                tip: nil,
                examples: [],
                tags: []
            )
        ],
        lessCommonTranslations: []
    ),
    Lexeme(
        id: "LEXEME_2",
        language: Language.english,
        text: "lounge",
        partOfSpeech: PartOfSpeech.VERB,
        transcription: ["laʊnʤ"],
        forms: [],
        translations: [
            LexemeTranslation(
                id: "TRANSLATION_1",
                text: "бездельничать",
                tip: nil,
                examples: [],
                tags: []
            )
        ],
        lessCommonTranslations: []
    )
]
