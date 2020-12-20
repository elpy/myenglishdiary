//
//  MakeGroupUseCase.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.11.2020.
//

import Foundation

final class MakeGroupUseCase: UseCase {

    private let group: Group
    private let diaryDataProvider: DiaryDataProvider

    init(named name: String, _ diaryDataProvider: DiaryDataProvider) {
        let group = Group(name: name)

        self.group = group
        self.diaryDataProvider = diaryDataProvider
    }

    func execute(_ completion: (Result<Void, Error>) -> Void) {
        do {
            try diaryDataProvider.addNewGroup(group)
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }
}
