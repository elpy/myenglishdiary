//
//  MarkNoteWithTagUseCaseTest.swift
//  MyEnglishDiaryTests
//
//  Created by Антон Скворцов on 20.12.2020.
//

import XCTest
@testable import MyEnglishDiary

final class MarkNoteWithTagUseCaseTest: XCTestCase {

    private var diaryDataProvider: DiaryDataProviderMock?

    override func setUpWithError() throws {
        diaryDataProvider = DiaryDataProviderMock()
    }

    func testMakeNote() throws {
        let note = Note(
            group: nil,
            date: Date(),
            language: Language.RUS,
            lexeme: "test value",
            partOfSpeech: nil,
            transcription: nil,
            meanings: [],
            tags: []
        )
        let tag = Tag(type: TagType.lastSuccessfulAttemptToStudy, date: Date())

        let useCase = MarkNoteWithTagUseCase(note: note, tag: tag, diaryDataProvider!)
        let expectation = XCTestExpectation(description: "Method executes successfully once")
        useCase.execute {
            if case .success = $0 {
                XCTAssertEqual(1, diaryDataProvider?.notesMarked.count)
                XCTAssertEqual(note.lexeme, diaryDataProvider?.notesMarked.first?.lexeme)
                XCTAssertEqual(note.partOfSpeech, diaryDataProvider?.notesMarked.first?.partOfSpeech)
                XCTAssertEqual([tag], diaryDataProvider?.notesMarked.first?.tags)
                expectation.fulfill()
            } else {
                XCTFail("Success result expected")
            }
        }
    }
}
