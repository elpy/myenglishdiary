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

    override func setUp() {
        diaryDataProvider = DiaryDataProviderMock()
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
        let expectation = XCTestExpectation(description: "Method executes successfully once")
        useCase.execute {
            if case .success = $0 {
                XCTAssertEqual(1, self.diaryDataProvider?.notesAdded.count)
                XCTAssertEqual(lexeme.text, self.diaryDataProvider?.notesAdded.first?.lexeme.text)
                XCTAssertEqual(lexeme.partOfSpeech, self.diaryDataProvider?.notesAdded.first?.lexeme.partOfSpeech)
                expectation.fulfill()
            } else {
                XCTFail("Success result expected")
            }
        }
    }
}
