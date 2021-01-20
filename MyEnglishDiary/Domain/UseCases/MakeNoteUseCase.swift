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

    init(from lexeme: Lexeme, _ diaryDataProvider: DiaryDataProvider) {
        let note = Note(
            group: nil,
            date: Date(),
            language: lexeme.language,
            lexeme: lexeme.text,
            partOfSpeech: lexeme.partOfSpeech,
            transcription: lexeme.transcription,
            meanings: lexeme.meanings,
            tags: []
        )

        self.note = note
        self.diaryDataProvider = diaryDataProvider
    }

    func execute(_ completion: @escaping (Result<Void, Error>) -> Void) {
        diaryDataProvider.addNewNote(note) { result in
            switch result {
            case .success: completion(.success(()))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
