//
//  DiaryViewModel.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 20.01.2021.
//

import Combine

final class DiaryViewModel: ObservableObject {
    @Published var notes: [DiaryRecord] = []
    @Published var groups: [DiaryRecordsGroup] = []
    @Published var displayReadingFailure: WtfFailure?

    private var cancellableSet: Set<AnyCancellable> = []

    func fetchDiary() {
        let readNotesUseCase = DependencyContainer.shared.makeReadDiaryRecordsUseCase()
        readNotesUseCase.execute { result in
            switch result {
            case .success(let notes): self.notes = notes
            case .failure: self.displayReadingFailure = WtfFailure.developmentError
            }
        }

        let readGroupsUseCase = DependencyContainer.shared.makeReadRecordsGroupsUseCase()
        readGroupsUseCase.execute { result in
            switch result {
            case .success(let groups): self.groups = groups
            case .failure: self.displayReadingFailure = WtfFailure.developmentError
            }
        }
    }
}
