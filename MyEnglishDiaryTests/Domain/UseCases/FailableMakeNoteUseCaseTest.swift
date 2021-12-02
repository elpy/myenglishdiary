//
//  FailableMakeNoteUseCaseTest.swift
//  MyEnglishDiaryTests
//
//  Created by Антон Скворцов on 20.12.2020.
//

import XCTest
@testable import MyEnglishDiary

final class FailableMakeNoteUseCaseTest: XCTestCase {
    private var diaryDataProvider: FailableDiaryDataProviderMock?

    override func setUp() {
        diaryDataProvider = FailableDiaryDataProviderMock()
    }

    func testMakeNote() {
        let lexeme = Lexeme(
            language: Language.Russian,
            text: "some lexeme",
            partOfSpeech: PartOfSpeech.INTERJECTION,
            transcription: "a",
            meanings: []
        )
        let useCase = MakeDiaryRecordUseCase(from: lexeme, in: nil, diaryDataProvider!)
        let expectation = XCTestExpectation(description: "Method fails once")
        useCase.execute {
            if case .failure(let error) = $0, case DataProviderError.networkError = error {
                expectation.fulfill()
            } else {
                XCTFail("\(DataProviderError.networkError) expected")
            }
        }
    }
}
