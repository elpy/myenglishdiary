//
//  FailableSearchUseCaseTest.swift
//  MyEnglishDiaryTests
//
//  Created by Антон Скворцов on 20.12.2020.
//

import XCTest
@testable import MyEnglishDiary

final class FailableSearchUseCaseTest: XCTestCase {
    private var dictionaryDataProvider: DictionaryDataProvider?

    override func setUp() {
        dictionaryDataProvider = FailableDictionaryDataProviderMock()
    }

    func testSearch() {
        let useCase = SearchUseCase(for: "AnyString", dictionaryDataProvider!)

        let expectation = XCTestExpectation(description: "Search throws an error")
        expectation.assertForOverFulfill = true
        useCase.execute {
            if case .failure(let error) = $0, case DataProviderError.networkError = error {
                expectation.fulfill()
            } else {
                XCTFail("\(DataProviderError.networkError) expected")
            }
        }
    }
}
