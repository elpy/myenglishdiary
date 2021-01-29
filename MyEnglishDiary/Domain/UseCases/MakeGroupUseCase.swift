//
//  MakeGroupUseCase.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.11.2020.
//

import Foundation

final class MakeGroupUseCase: UseCase {
    private let group: NotesGroup
    private let diaryDataProvider: DiaryDataProvider

    init(named name: String, _ diaryDataProvider: DiaryDataProvider) {
        let group = NotesGroup(name: name)

        self.group = group
        self.diaryDataProvider = diaryDataProvider
    }

    func execute(_ completion: @escaping (Result<NotesGroup, Error>) -> Void) {
        diaryDataProvider.addNewGroup(group) { result in
            switch result {
            case .success: completion(.success(self.group))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
