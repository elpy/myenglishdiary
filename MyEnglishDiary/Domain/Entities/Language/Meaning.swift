//
//  Meaning.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 16.12.2020.
//

import Foundation

struct Meaning {
    let text: String
    let lexemesWithSimilarMeaning: [String]
    let examples: [Example]
}

extension Array where Element == Meaning {
    func asString() -> String {
        return self.map { $0.text }.joined(separator: ", ")
    }
}
