//
//  FailableMakeGroupUseCaseTest.swift
//  MyEnglishDiaryTests
//
//  Created by Антон Скворцов on 20.12.2020.
//

import XCTest
@testable import MyEnglishDiary

final class FailableMakeGroupUseCaseTest: XCTestCase {

    private var diaryDataProvider: FailableDiaryDataProviderMock?

    override func setUpWithError() throws {
        diaryDataProvider = FailableDiaryDataProviderMock()
    }

    func testMakeNote() throws {
        let useCase = MakeGroupUseCase(named: "test value", diaryDataProvider!)
        let expectation = XCTestExpectation(description: "Method fails once")
        useCase.execute {
            if case .failure(let error) = $0, case DataProviderError.error = error {
                expectation.fulfill()
            } else {
                XCTFail("\(DataProviderError.error) expected")
            }
        }
    }
}
