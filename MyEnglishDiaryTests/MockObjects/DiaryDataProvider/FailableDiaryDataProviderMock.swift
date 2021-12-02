//
//  FailableDiaryDataProviderMock.swift
//  MyEnglishDiaryTests
//
//  Created by Антон Скворцов on 20.12.2020.
//

import XCTest
@testable import MyEnglishDiary

final class FailableDiaryDataProviderMock: DiaryDataProvider {
    func addNewRecord(_ note: DiaryRecord, _ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.failure(DataProviderError.networkError))
    }

    func addNewGroup(_ group: DiaryRecordsGroup, _ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.failure(DataProviderError.networkError))
    }

    func getRecords(_ completion: @escaping (Result<[DiaryRecord], Error>) -> Void) {
        completion(.failure(DataProviderError.networkError))
    }

    func getGroups(_ completion: @escaping (Result<[DiaryRecordsGroup], Error>) -> Void) {
        completion(.failure(DataProviderError.networkError))
    }

    func markNote(_ note: DiaryRecord, with tag: TranslationTag, _ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.failure(DataProviderError.networkError))
    }
}
