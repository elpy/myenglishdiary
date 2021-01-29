//
//  MakeNoteUseCase.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.11.2020.
//

import Foundation

final class MakeNoteUseCase: UseCase {
    private let note: Note
    private let diaryDataProvider: DiaryDataProvider

    init(from lexeme: Lexeme, in group: NotesGroup?, _ diaryDataProvider: DiaryDataProvider) {
        let note = Note(
            lexeme: lexeme,
            group: group,
            date: Date(),
            tags: []
        )

        self.note = note
        self.diaryDataProvider = diaryDataProvider
    }

    func execute(_ completion: @escaping (Result<Note, Error>) -> Void) {
        diaryDataProvider.addNewNote(note) { result in
            switch result {
            case .success: completion(.success(self.note))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
