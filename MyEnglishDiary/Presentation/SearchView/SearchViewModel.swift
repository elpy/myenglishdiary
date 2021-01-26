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
    @Published var searchResult: DictionarySearchResult = []
    @Published var lexemeIdsInDiary: [String] = []

    @Published var displayEmptyResultMessage: Bool = false
    @Published var displaySearchFailure: WtfFailure?

    private var cancellableSet: Set<AnyCancellable> = []
    private var activeUseCase: SearchUseCase?

    init() {
        $text
            .throttle(for: 0.5, scheduler: RunLoop.main, latest: true)
            .removeDuplicates()
            .sink { text in
                self.activeUseCase?.cancel()

                let text = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                guard text.count > 1 else { return }

                let useCase = DependencyContainer.shared.makeSearchUseCase(for: text)
                self.activeUseCase = useCase

                useCase.execute { result in
                    if case .success(let lexemes) = result {
                        DispatchQueue.main.async {
                            self.searchResult = lexemes
                            self.displayEmptyResultMessage = lexemes.isEmpty && text.count > 1
                        }
                    } else if case .failure(let error) = result {
                        print(error)
                        DispatchQueue.main.async {
                            self.displaySearchFailure = .developmentError
                        }
                    }

                    self.activeUseCase = nil
                }
            }
            .store(in: &cancellableSet)
    }

    func fetchDiary() {
        let readNotesUseCase = DependencyContainer.shared.makeReadNotesUseCase()
        readNotesUseCase.execute { result in
            switch result {
            case .success(let notes): self.lexemeIdsInDiary = notes.map { $0.lexemeId }
            case .failure: fatalError("Couldn't read diary data")
            }
        }
    }
}
