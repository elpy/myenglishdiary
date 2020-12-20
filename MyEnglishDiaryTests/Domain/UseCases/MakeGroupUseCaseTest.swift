//
//  MakeGroupUseCaseTest.swift
//  MyEnglishDiaryTests
//
//  Created by Антон Скворцов on 20.12.2020.
//

import XCTest
@testable import MyEnglishDiary

final class MakeGroupUseCaseTest: XCTestCase {

    private var diaryDataProvider: DiaryDataProviderMock?

    override func setUpWithError() throws {
        diaryDataProvider = DiaryDataProviderMock()
    }

    func testMakeNote() throws {
        let groupName = "test value"
        let useCase = MakeGroupUseCase(named: "test value", diaryDataProvider!)
        let expectation = XCTestExpectation(description: "Method executes successfully once")
        useCase.execute {
            if case .success = $0 {
                XCTAssertEqual(1, diaryDataProvider?.groupsAdded.count)
                XCTAssertEqual(groupName, diaryDataProvider?.groupsAdded.first?.name)
                expectation.fulfill()
            } else {
                XCTFail("Success result expected")
            }
        }
    }
}
