//
//  SearchViewModel.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.12.2020.
//

import Foundation
import Combine

// TODO: do anything with this
enum WtfFailure: String, Identifiable {
    var id: String { rawValue }
    case developmentError = "Error"
}

final class SearchViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var searchState: LoadingState<DictionarySearchResult> = .loaded([])
    @Published var lexemeIdsInDiary: [String] = []

    private var cancellableSet: Set<AnyCancellable> = []
    private var activeUseCase: SearchUseCase?

    init() {
        $text
            .throttle(for: 0.5, scheduler: RunLoop.main, latest: true)
            .removeDuplicates()
            .sink { text in
                self.activeUseCase?.cancel()

                let text = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                guard !text.isEmpty else {
                    DispatchQueue.main.async { self.searchState = .loaded([]) }
                    return
                }

                if case .loaded(let data) = self.searchState, !data.isEmpty {
                    self.searchState = .updating(data)
                } else {
                    self.searchState = .loading
                }

                let useCase = DependencyContainer.shared.makeSearchUseCase(for: text)
                self.activeUseCase = useCase

                useCase.execute { result in
                    if case .success(let lexemes) = result {
                        DispatchQueue.main.async {
                            self.searchState = .loaded(lexemes)
                        }
                    } else if case .failure(let error) = result {
                        print(error)
                        DispatchQueue.main.async {
                            self.searchState = .errored(error)
                        }
                    }

                    self.activeUseCase = nil
                }
            }
            .store(in: &cancellableSet)
    }

    func fetchDiary() {
        let readNotesUseCase = DependencyContainer.shared.makeReadDiaryRecordsUseCase()
        readNotesUseCase.execute { result in
            switch result {
            case .success(let notes): self.lexemeIdsInDiary = notes.map { $0.lexeme.id }
            case .failure: fatalError("Couldn't read diary data")
            }
        }
    }
}
