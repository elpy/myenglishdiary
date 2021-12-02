//
//  Exercise+Extensions.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 02.12.2021.
//

import Foundation

extension Exercise: Identifiable {}

extension Exercise: Equatable {
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Exercise: Comparable {
    public static func < (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.date < rhs.date
    }
}
