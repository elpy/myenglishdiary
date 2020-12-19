//
//  MakeNoteUseCase.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.11.2020.
//

import Foundation

protocol MakeNoteUseCase {

    init(from lexeme: Lexeme)
    func execute(completion handler: (Result<Note, Error>) -> Void)
}
