//
//  LexemeViewModel.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 26.01.2021.
//

import Combine

final class LexemeViewModel: ObservableObject {
    let lexeme: Lexeme
    @Published var noteBasedOnLexeme: Note?
    @Published var groups: [Group] = []
    @Published var displayFetchingFailure: WtfFailure?
    @Published var displayMakingNoteFailure: WtfFailure?

    init(lexeme: Lexeme) {
        self.lexeme = lexeme
    }

    func fetchDiary() {
        let readNotesUseCase = DependencyContainer.shared.makeReadNotesUseCase()
        readNotesUseCase.execute { result in
            switch result {
            case .success(let notes): self.noteBasedOnLexeme = notes.first { note in note.lexemeId == self.lexeme.id }
            case .failure: self.displayFetchingFailure = WtfFailure.developmentError
            }
        }

        let readGroupsUseCase = DependencyContainer.shared.makeReadGroupsUseCase()
        readGroupsUseCase.execute { result in
            switch result {
            case .success(let groups): self.groups = groups
            case .failure: self.displayFetchingFailure = WtfFailure.developmentError
            }
        }
    }

    func makeNote(placement: NotePlacement) {
        var group: Group?
        if case .inGroup(let value) = placement {
            group = value
        }

        let makeNoteUseCase = DependencyContainer.shared.makeMakeNoteUseCase(from: lexeme, in: group)
        makeNoteUseCase.execute { result in
            switch result {
            case .success(let note): self.noteBasedOnLexeme = note
            case .failure: self.displayMakingNoteFailure = WtfFailure.developmentError
            }
        }
    }
}
