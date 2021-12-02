//
//  MakeDiaryRecordUseCase.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.11.2020.
//

import Foundation

final class MakeDiaryRecordUseCase: UseCase {
    private let note: DiaryRecord
    private let diaryDataProvider: DiaryDataProvider

    init(from lexeme: Lexeme, in group: DiaryRecordsGroup?, _ diaryDataProvider: DiaryDataProvider) {
        let note = DiaryRecord(
            id: UUID().uuidString,
            lexeme: lexeme,
            group: group,
            date: Date(),
            studyingLog: []
        )

        self.note = note
        self.diaryDataProvider = diaryDataProvider
    }

    func execute(_ completion: @escaping (Result<DiaryRecord, Error>) -> Void) {
        diaryDataProvider.addNewRecord(note) { result in
            switch result {
            case .success: completion(.success(self.note))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
