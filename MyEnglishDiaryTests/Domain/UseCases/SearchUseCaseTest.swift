//
//  SearchUseCaseTest.swift
//  MyEnglishDiaryTests
//
//  Created by Антон Скворцов on 19.12.2020.
//

import XCTest
@testable import MyEnglishDiary

class SearchUseCaseTest: XCTestCase {

    func testSearchForEmptyString() throws {
        let dictionaryDataProvider = TestDictionaryDataProvider()
        let text = ""
        let useCase = SearchUseCase(for: text, dictionaryDataProvider)

        let expectation = XCTestExpectation(description: "Search executes successfully")
        expectation.assertForOverFulfill = true
        useCase.execute {
            if case .success(let result) = $0 {
                XCTAssertEqual(result.count, dictionaryDataProvider.searchResult.count)
                expectation.fulfill()
            } else {
                XCTFail("Incorrect number of search result elements")
            }
        }
    }

    func testSearchForString() throws {
        let dictionaryDataProvider = TestDictionaryDataProvider()
        let text = "last"
        let useCase = SearchUseCase(for: text, dictionaryDataProvider)

        let expectation = XCTestExpectation(description: "Search executes successfully")
        expectation.assertForOverFulfill = true
        useCase.execute {
            if case .success(let result) = $0 {
                XCTAssertEqual(result.count, dictionaryDataProvider.searchResult.count)
                expectation.fulfill()
            } else {
                XCTFail("Incorrect number of search result elements")
            }
        }
    }

    func testSearchWithFailingDataProvider() throws {
        let dictionaryDataProvider = FailingDictionaryDataProvider()
        let text = ""
        let useCase = SearchUseCase(for: text, dictionaryDataProvider)

        let expectation = XCTestExpectation(description: "Search throws an error")
        expectation.assertForOverFulfill = true
        useCase.execute {
            if case .failure(let error) = $0, case DataProviderError.error = error {
                expectation.fulfill()
            } else {
                XCTFail("Expected \(DataProviderError.error)")
            }
        }
    }
}
