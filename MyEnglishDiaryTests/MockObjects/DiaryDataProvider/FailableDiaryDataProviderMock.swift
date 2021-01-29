//
//  FailableDiaryDataProviderMock.swift
//  MyEnglishDiaryTests
//
//  Created by Антон Скворцов on 20.12.2020.
//

import XCTest
@testable import MyEnglishDiary

final class FailableDiaryDataProviderMock: DiaryDataProvider {
    func addNewNote(_ note: Note, _ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.failure(DataProviderError.networkError))
    }

    func addNewGroup(_ group: NotesGroup, _ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.failure(DataProviderError.networkError))
    }

    func getNotes(_ completion: @escaping (Result<[Note], Error>) -> Void) {
        completion(.failure(DataProviderError.networkError))
    }

    func getGroups(_ completion: @escaping (Result<[NotesGroup], Error>) -> Void) {
        completion(.failure(DataProviderError.networkError))
    }

    func markNote(_ note: Note, with tag: Tag, _ completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.failure(DataProviderError.networkError))
    }
}
