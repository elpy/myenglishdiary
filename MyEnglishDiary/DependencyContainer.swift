//
//  DependencyContainer.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 11.12.2020.
//

import Foundation

class DependencyContainer {
    static let shared = DependencyContainer()
    private var dictionaryDataProvider: DictionaryDataProvider = DevelopmentDictionaryDataProvider()

    init() {

    }

    func makeSearchUseCase(for text: String) -> SearchUseCase {
        return SearchUseCase(for: text, dictionaryDataProvider)
    }
}
