//
//  Note.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.11.2020.
//

import Foundation

struct Note {
    let group: Group?
    let date: Date
    let language: Language
    let text: String
    let partOfSpeech: PartOfSpeech?
    let transcription: String?
    let meanings: [Meaning]
    let tags: [Tag]
}

extension Note: Identifiable {
    var id: String {
        return "\(text)_\(partOfSpeech?.rawValue ?? "")_\(date)"
    }

    var lexemeId: String {
        return "\(text)_\(partOfSpeech?.rawValue ?? "")"
    }
}
