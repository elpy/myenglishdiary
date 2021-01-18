//
//  PartOfSpeech.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 16.12.2020.
//

import Foundation

enum PartOfSpeech: String {
    case NOUN = "noun"
    case PRONOUN = "pronoun"
    case ADJECTIVE = "adjective"
    case VERB = "verb"
    case ADVERB = "adverb"
    case PREPOSITION = "preposition"
    case CONJUNCTION = "conjunction"
    case NUMERAl = "numeral"
    case INTERJECTION = "interjection"
    case PREDICATIVE = "predicative"
}

extension PartOfSpeech {
    init?(text: String) {
        let partOfSpeech = PartOfSpeech(rawValue: text)

        if let value = partOfSpeech {
            self = value
        } else {
            return nil
        }
    }
}

extension PartOfSpeech: Comparable {
    private var sortOrder: Int {
        switch self {
        case .NOUN:
            return 0
        case .VERB:
            return 1
        case .ADJECTIVE:
            return 2
        case .ADVERB:
            return 3
        case .PRONOUN:
            return 4
        case .PREPOSITION:
            return 5
        case .CONJUNCTION:
            return 6
        case .INTERJECTION:
            return 7
        case .NUMERAl:
            return 8
        case .PREDICATIVE:
            return 9
        }
    }

    public static func < (lhs: PartOfSpeech, rhs: PartOfSpeech) -> Bool {
        return lhs.sortOrder < rhs.sortOrder
    }
}
