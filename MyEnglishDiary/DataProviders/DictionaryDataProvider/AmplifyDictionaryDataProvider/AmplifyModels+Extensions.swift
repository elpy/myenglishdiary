//
//  AmplifyModels+Extension.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 29.11.2021.
//

import Foundation
import Amplify

extension LexemeGraphQLModel {
    func mapModel() -> Lexeme {
        return Lexeme(
            id: id,
            language: language.mapEnum(),
            text: text,
            partOfSpeech: PartOfSpeech(text: partOfSpeech ?? ""),
            transcription: transcription ?? [],
            forms: forms ?? [],
            translations: translations?.mapModels() ?? [],
            lessCommonTranslations: lessCommonTranslations?.mapModels() ?? []
        )
    }
}

extension TranslationGraphQLModel {
    func mapModel() -> LexemeTranslation {
        return LexemeTranslation(
            id: id,
            text: text,
            tip: tip,
            examples: examples?.mapModels() ?? [],
            tags:tags?.mapModels() ?? []
        )
    }
}

extension ExampleGraphQLModel {
    func mapModel() -> TranslationExample {
        return TranslationExample(id: id, text: text, translation: translation)
    }
}

extension TagGraphQLModel {
    func mapModel() -> TranslationTag {
        return TranslationTag(id: id, text: text)
    }
}

extension Array where Element == LexemeGraphQLModel {
    func mapModels() -> [Lexeme] {
        return self.map { $0.mapModel() }
    }
}

extension List where Element == TranslationGraphQLModel {
    func mapModels() -> [LexemeTranslation] {
        return self.map { $0.mapModel() }
    }
}

extension List where Element == ExampleGraphQLModel {
    func mapModels() -> [TranslationExample] {
        return self.map { $0.mapModel() }
    }
}

extension List where Element == TagGraphQLModel {
    func mapModels() -> [TranslationTag] {
        return self.map { $0.mapModel() }
    }
}

extension LanguageGraphQlEnum {
    func mapEnum() -> Language {
        switch self {
        case.en: return .english
        case.ru: return .russian
        }
    }
}
