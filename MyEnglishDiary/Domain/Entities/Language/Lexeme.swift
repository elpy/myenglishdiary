//
//  Lexeme.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 16.12.2020.
//

import Foundation

struct Lexeme {
    let language: Language
    let text: String
    let partOfSpeech: PartOfSpeech?
    let transcription: String?
    let meanings: [Meaning]
}

extension Lexeme: Identifiable {
    var id: String {
        return "\(text)_\(partOfSpeech?.rawValue ?? "")"
    }
}

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
