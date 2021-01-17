//
//  SearchViewModel.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.12.2020.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var searchResult: DictionarySearchResult = []

    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        $text
            .throttle(for: 0.5, scheduler: RunLoop.main, latest: true)
            .removeDuplicates()
            .sink { text in
                let useCase = DependencyContainer.shared.makeSearchUseCase(for: text)
                useCase.execute { result in
                    if case .success(let lexemes) = result {
                        DispatchQueue.main.async {
                            self.searchResult = lexemes
                        }
                    } else {
                        print(result)
                    }
                }
            }
            .store(in: &cancellableSet)
    }
}
