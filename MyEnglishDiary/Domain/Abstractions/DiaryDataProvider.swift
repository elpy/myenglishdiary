//
//  DiaryDataProvider.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 19.12.2020.
//

import Foundation

protocol DiaryDataProvider {
    func addNewRecord(_ note: DiaryRecord, _ completion: @escaping (Result<Void, Error>) -> Void)
    func addNewGroup(_ group: DiaryRecordsGroup, _ completion: @escaping (Result<Void, Error>) -> Void)
    func getRecords(_ completion: @escaping (Result<[DiaryRecord], Error>) -> Void)
    func getGroups(_ completion: @escaping (Result<[DiaryRecordsGroup], Error>) -> Void)
    func markNote(_ note: DiaryRecord, with tag: TranslationTag, _ completion: @escaping (Result<Void, Error>) -> Void)
}
