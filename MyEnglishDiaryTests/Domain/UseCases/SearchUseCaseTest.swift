//
//  SearchUseCaseTest.swift
//  MyEnglishDiaryTests
//
//  Created by Антон Скворцов on 19.12.2020.
//

import XCTest
@testable import MyEnglishDiary

final class SearchUseCaseTest: XCTestCase {
    private var dictionaryDataProvider: DictionaryDataProvider?

    override func setUp() {
        dictionaryDataProvider = DictionaryDataProviderMock()
    }

    func testSearch() {
        let dictionaryDataProvider = DictionaryDataProviderMock()
        let useCase = SearchUseCase(for: "AnyString", dictionaryDataProvider)

        let expectation = XCTestExpectation(description: "Search executes successfully")
        expectation.assertForOverFulfill = true
        useCase.execute {
            if case .success(let result) = $0 {
                XCTAssertEqual(result, dictionaryDataProvider.searchResult)
                expectation.fulfill()
            } else {
                XCTFail("Expected Result.success")
            }
        }
    }
}
