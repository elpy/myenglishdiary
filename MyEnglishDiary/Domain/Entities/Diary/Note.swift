//
//  Note.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.11.2020.
//

import Foundation

struct Note {
    let lexeme: Lexeme
    let group: NotesGroup?
    let date: Date
    let tags: [Tag]
}

extension Note: Identifiable {
    var id: String {
        return "\(lexeme.id)_\(date)"
    }
}
