//
//  Studying.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.11.2020.
//

import Foundation

protocol RecordsSelectionStrategy {

}

protocol Studying {
    func selectRecordToStudy(with strategy: RecordsSelectionStrategy, from group: DiaryRecordsGroup?) -> [DiaryRecord]
}
