//
//  Lexeme.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 16.12.2020.
//

import Foundation

struct Lexeme {
    let id: String
    let language: Language
    let text: String
    let partOfSpeech: PartOfSpeech?
    let transcription: [String]
    let forms: [String]
    let translations: [LexemeTranslation]
    let lessCommonTranslations: [LexemeTranslation]
}
