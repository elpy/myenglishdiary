//
//  Lexeme.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 16.12.2020.
//

import Foundation

struct Lexeme {

    let language: Language
    let lexeme: String
    let partOfSpeech: PartOfSpeech?
    let transcription: String?
    let meanings: [Meaning]
}
