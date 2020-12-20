//
//  Tag.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 19.12.2020.
//

import Foundation

struct Tag {
    let type: TagType
    let date: Date
}

enum TagType: String {
    case lastSuccessfulAttemptToStudy
}

extension Tag: Equatable {
    static func == (lhs: Tag, rhs: Tag) -> Bool {
        return lhs.type == rhs.type && lhs.date == rhs.date
    }
}

extension Tag: Comparable {
    public static func < (lhs: Tag, rhs: Tag) -> Bool {
        return lhs.date < rhs.date
    }
}
