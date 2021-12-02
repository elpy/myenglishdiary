//
//  Excercise+Extensions.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 02.12.2021.
//

import Foundation

extension Excercise: Identifiable {}

extension Excercise: Equatable {
    static func == (lhs: Excercise, rhs: Excercise) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Excercise: Comparable {
    public static func < (lhs: Excercise, rhs: Excercise) -> Bool {
        return lhs.date < rhs.date
    }
}
