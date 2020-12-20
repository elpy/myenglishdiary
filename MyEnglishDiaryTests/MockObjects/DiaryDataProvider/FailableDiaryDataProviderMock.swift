//
//  FailableDiaryDataProviderMock.swift
//  MyEnglishDiaryTests
//
//  Created by Антон Скворцов on 20.12.2020.
//

import XCTest
@testable import MyEnglishDiary

final class FailableDiaryDataProviderMock: DiaryDataProvider {

    func addNewNote(_ note: Note) throws {
        throw DataProviderError.error
    }

    func addNewGroup(_ group: Group) throws {
        throw DataProviderError.error
    }

    func getNotes() throws -> [Note] {
        throw DataProviderError.error
    }

    func getGroups() throws -> [Group] {
        throw DataProviderError.error
    }

    func markNote(_ note: Note, with tag: Tag) throws {
        throw DataProviderError.error
    }
}
