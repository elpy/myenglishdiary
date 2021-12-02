//
//  LexemeTranslation+Extensions.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 29.11.2021.
//

import Foundation

extension LexemeTranslation: Identifiable {}

extension Array where Element == LexemeTranslation {
    func asString() -> String {
        return self.map { $0.text }.joined(separator: ", ")
    }
}
