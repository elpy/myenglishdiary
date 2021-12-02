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

    override func setUp() {
        diaryDataProvider = DiaryDataProviderMock()
    }

    func testMakeNote() {
        let note = DiaryRecord(
            lexeme: Lexeme(
                language: Language.English,
                text: "any value",
                partOfSpeech: PartOfSpeech.ADVERB,
                transcription: "any value",
                meanings: []
            ),
            group: nil,
            date: Date(),
            tags: []
        )
        let tag = TranslationTag(type: TagType.lastSuccessfulAttemptToStudy, date: Date())

        let useCase = MarkNoteWithTagUseCase(note: note, tag: tag, diaryDataProvider!)
        let expectation = XCTestExpectation(description: "Method executes successfully once")
        useCase.execute {
            if case .success = $0 {
                XCTAssertEqual(1, self.diaryDataProvider?.notesMarked.count)
                XCTAssertEqual(note.lexeme, self.diaryDataProvider?.notesMarked.first?.lexeme)
                XCTAssertEqual(note.lexeme.partOfSpeech, self.diaryDataProvider?.notesMarked.first?.lexeme.partOfSpeech)
                XCTAssertEqual([tag], self.diaryDataProvider?.notesMarked.first?.studyingLog)
                expectation.fulfill()
            } else {
                XCTFail("Success result expected")
            }
        }
    }
}
