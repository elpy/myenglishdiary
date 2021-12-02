//
//  DiaryRecord.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.11.2020.
//

import Foundation

struct DiaryRecord {
    let id: String
    let lexeme: Lexeme
    let group: DiaryRecordsGroup?
    let date: Date
    let studyingLog: [Exercise]
}
