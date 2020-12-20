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

    override func setUpWithError() throws {
        diaryDataProvider = FailableDiaryDataProviderMock()
    }

    func testMakeNote() throws {
        let lexeme = Lexeme(
            language: Language.RUS,
            lexeme: "some lexeme",
            partOfSpeech: PartOfSpeech.INTERJECTION,
            transcription: "a",
            meanings: []
        )
        let useCase = MakeNoteUseCase(from: lexeme, diaryDataProvider!)
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
