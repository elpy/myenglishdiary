//
//  ReadRecordsGroupsUseCase.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 20.01.2021.
//

import Foundation

final class ReadRecordsGroupsUseCase: UseCase {
    private let diaryDataProvider: DiaryDataProvider

    init(_ diaryDataProvider: DiaryDataProvider) {
        self.diaryDataProvider = diaryDataProvider
    }

    func execute(_ completion: @escaping (Result<[DiaryRecordsGroup], Error>) -> Void) {
        diaryDataProvider.getGroups { result in
            switch result {
            case .success(let groups): completion(.success(groups))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
