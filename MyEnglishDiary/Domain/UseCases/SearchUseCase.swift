//
//  SearchUseCase.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.11.2020.
//

import Foundation

final class SearchUseCase: UseCase {
    private let text: String
    private let dictionaryDataProvider: DictionaryDataProvider

    init(for text: String, _ dictionaryDataProvider: DictionaryDataProvider) {
        self.text = text.lowercased()
        self.dictionaryDataProvider = dictionaryDataProvider
    }

    func execute(_ completion: @escaping (Result<DictionarySearchResult, Error>) -> Void) {
        guard text.count > 2 else {
            completion(.success([]))
            return
        }

        dictionaryDataProvider.search(for: text) { operationResult in
            switch operationResult {
            case .failure(let error):
                completion(.failure(error))
            case .success(let searchResult):
                completion(.success(searchResult))
            }
        }
    }
}
