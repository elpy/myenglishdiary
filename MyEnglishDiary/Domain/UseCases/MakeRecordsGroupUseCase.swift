//
//  MakeRecordsGroupUseCase.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.11.2020.
//

import Foundation

final class MakeRecordsGroupUseCase: UseCase {
    private let group: DiaryRecordsGroup
    private let diaryDataProvider: DiaryDataProvider

    init(named name: String, _ diaryDataProvider: DiaryDataProvider) {
        let group = DiaryRecordsGroup(id: UUID.init().uuidString, name: name)

        self.group = group
        self.diaryDataProvider = diaryDataProvider
    }

    func execute(_ completion: @escaping (Result<DiaryRecordsGroup, Error>) -> Void) {
        diaryDataProvider.addNewGroup(group) { result in
            switch result {
            case .success: completion(.success(self.group))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
