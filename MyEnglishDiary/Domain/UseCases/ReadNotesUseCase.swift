//
//  ReadNotesUseCase.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 20.01.2021.
//

import Foundation

final class ReadNotesUseCase: UseCase {
    private let diaryDataProvider: DiaryDataProvider

    init(_ diaryDataProvider: DiaryDataProvider) {
        self.diaryDataProvider = diaryDataProvider
    }

    func execute(_ completion: @escaping (Result<[Note], Error>) -> Void) {
        diaryDataProvider.getNotes { result in
            switch result {
            case .success(let notes): completion(.success(notes))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
