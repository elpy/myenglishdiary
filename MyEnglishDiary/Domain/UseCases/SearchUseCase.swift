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
        self.text = text
        self.dictionaryDataProvider = dictionaryDataProvider
    }

    func execute(_ completion: (Result<DictionarySearchResult, Error>) -> Void) {
        if text.isEmpty {
            completion(.success([]))
            return
        }

        do {
            let lexemes = try dictionaryDataProvider.search(for: text)
            completion(.success(lexemes))
        } catch {
            completion(.failure(error))
        }
    }
}
