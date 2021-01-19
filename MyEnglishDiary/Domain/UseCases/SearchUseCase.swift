//
//  SearchUseCase.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.11.2020.
//

import Combine

final class SearchUseCase: UseCase, Cancellable {
    private let text: String
    private let dictionaryDataProvider: DictionaryDataProvider
    private var isCancelled: Bool = false

    init(for text: String, _ dictionaryDataProvider: DictionaryDataProvider) {
        self.text = text.lowercased()
        self.dictionaryDataProvider = dictionaryDataProvider
    }

    func execute(_ completion: @escaping (Result<DictionarySearchResult, Error>) -> Void) {
        guard isCancelled == false else { return }

        guard text.count > 1 else {
            completion(.success([]))
            return
        }

        if isCancelled == true { return }

        dictionaryDataProvider.search(for: text) { operationResult in
            if self.isCancelled == true { return }

            switch operationResult {
            case .failure(let error):
                completion(.failure(error))
            case .success(let searchResult):
                completion(.success(searchResult))
            }
        }
    }

    func cancel() {
        isCancelled = true
        print("Cancelled search use case for: \(text)")
    }
}
