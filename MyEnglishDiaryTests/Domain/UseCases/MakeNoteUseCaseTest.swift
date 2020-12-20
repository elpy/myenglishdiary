//
//  MakeNoteUseCaseTest.swift
//  MyEnglishDiaryTests
//
//  Created by Антон Скворцов on 19.12.2020.
//

import XCTest
@testable import MyEnglishDiary

final class MakeNoteUseCaseTest: XCTestCase {

    private var diaryDataProvider: DiaryDataProviderMock?

    override func setUpWithError() throws {
        diaryDataProvider = DiaryDataProviderMock()
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
        let expectation = XCTestExpectation(description: "Method executes successfully once")
        useCase.execute {
            if case .success = $0 {
                XCTAssertEqual(1, diaryDataProvider?.notesAdded.count)
                XCTAssertEqual(lexeme.lexeme, diaryDataProvider?.notesAdded.first?.lexeme)
                XCTAssertEqual(lexeme.partOfSpeech, diaryDataProvider?.notesAdded.first?.partOfSpeech)
                expectation.fulfill()
            } else {
                XCTFail("Success result expected")
            }
        }
    }
}
