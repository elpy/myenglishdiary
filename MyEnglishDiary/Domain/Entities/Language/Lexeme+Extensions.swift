//
//  Lexeme+Extensions.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 29.11.2021.
//

import Foundation

extension Lexeme: Identifiable {}

extension Lexeme: Equatable {
    static func == (lhs: Lexeme, rhs: Lexeme) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Lexeme: Comparable {
    public static func < (lhs: Lexeme, rhs: Lexeme) -> Bool {
        if lhs.text != rhs.text {
            return lhs.text < rhs.text
        } else {
            return (lhs.partOfSpeech ?? PartOfSpeech.INTERJECTION) < (rhs.partOfSpeech ?? PartOfSpeech.INTERJECTION)
        }
    }
}
