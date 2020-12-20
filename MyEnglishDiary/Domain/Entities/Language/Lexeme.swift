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

extension Lexeme: Equatable {
    static func == (lhs: Lexeme, rhs: Lexeme) -> Bool {
        return lhs.lexeme == rhs.lexeme && lhs.partOfSpeech == rhs.partOfSpeech
    }
}

extension Lexeme: Comparable {
    public static func < (lhs: Lexeme, rhs: Lexeme) -> Bool {
        if lhs.lexeme != rhs.lexeme {
            return lhs.lexeme < rhs.lexeme
        } else {
            return (lhs.partOfSpeech ?? PartOfSpeech.INTERJECTION) < (rhs.partOfSpeech ?? PartOfSpeech.INTERJECTION)
        }
    }
}
