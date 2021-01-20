//
//  MarkNoteWithTagUseCase.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 19.12.2020.
//

import Foundation

final class MarkNoteWithTagUseCase: UseCase {
    private let note: Note
    private let tag: Tag
    private let diaryDataProvider: DiaryDataProvider

    init(note: Note, tag: Tag, _ diaryDataProvider: DiaryDataProvider) {
        self.note = note
        self.tag = tag
        self.diaryDataProvider = diaryDataProvider
    }

    func execute(_ completion: @escaping (Result<Void, Error>) -> Void) {
        diaryDataProvider.markNote(note, with: tag) { result in
            switch result {
            case .success: completion(.success(()))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
