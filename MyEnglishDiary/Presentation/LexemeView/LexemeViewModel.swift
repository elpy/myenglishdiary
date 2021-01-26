//
//  LexemeViewModel.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 26.01.2021.
//

import Combine

final class LexemeViewModel: ObservableObject {
    @Published var groups: [Group] = []
    @Published var displayFetchingFailure: WtfFailure?
    @Published var displayMakingNoteFailure: WtfFailure?

    func fetchGroups() {
        let readGroupsUseCase = DependencyContainer.shared.makeReadGroupsUseCase()
        readGroupsUseCase.execute { result in
            switch result {
            case .success(let groups): self.groups = groups
            case .failure: self.displayFetchingFailure = WtfFailure.developmentError
            }
        }
    }

    func makeNote(lexeme: Lexeme, placement: NotePlacement) {
        var group: Group?
        if case .inGroup(let value) = placement {
            group = value
        }

        let makeNoteUseCase = DependencyContainer.shared.makeMakeNoteUseCase(from: lexeme, in: group)
        makeNoteUseCase.execute { result in
            switch result {
            case .success: print("new note has been made")
            case .failure: self.displayMakingNoteFailure = WtfFailure.developmentError
            }
        }
    }
}
