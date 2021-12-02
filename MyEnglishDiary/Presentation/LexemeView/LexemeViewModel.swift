//
//  LexemeViewModel.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 26.01.2021.
//

import Combine

final class LexemeViewModel: ObservableObject {
    let lexeme: Lexeme
    @Published var record: DiaryRecord?
    @Published var groups: [DiaryRecordsGroup] = []
    @Published var displayFetchingFailure: WtfFailure?
    @Published var displayMakingNoteFailure: WtfFailure?

    var title: String {
        if record != nil {
            return ""
        }

        return "В дневнике"
    }

    init(lexeme: Lexeme) {
        self.lexeme = lexeme
    }

    func fetchDiary() {
        let readDiaryRecordsUseCase = DependencyContainer.shared.makeReadDiaryRecordsUseCase()
        readDiaryRecordsUseCase.execute { result in
            switch result {
            case .success(let records): self.record = records.first { record in record.lexeme.id == self.lexeme.id }
            case .failure: self.displayFetchingFailure = WtfFailure.developmentError
            }
        }

        let readDiaryRecordsGroupUseCase = DependencyContainer.shared.makeReadRecordsGroupsUseCase()
        readDiaryRecordsGroupUseCase.execute { result in
            switch result {
            case .success(let diaryGroups): self.groups = diaryGroups
            case .failure: self.displayFetchingFailure = WtfFailure.developmentError
            }
        }
    }

    func makeNote(placement: NotePlacement) {
        var group: DiaryRecordsGroup?
        if case .inGroup(let value) = placement {
            group = value
        }

        let makeNoteUseCase = DependencyContainer.shared.makeMakeDiaryRecordUseCase(from: lexeme, in: group)
        makeNoteUseCase.execute { result in
            switch result {
            case .success(let record): self.record = record
            case .failure: self.displayMakingNoteFailure = WtfFailure.developmentError
            }
        }
    }
}
