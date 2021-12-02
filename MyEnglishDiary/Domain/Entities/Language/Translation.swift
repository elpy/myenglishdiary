//
//  Translation.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 16.12.2020.
//

import Foundation

struct LexemeTranslation {
    let id: String
    let lexemeId: String
    let text: String
    let tip: String?
    let examples: [Example]
    let tags: [Tag]
}
