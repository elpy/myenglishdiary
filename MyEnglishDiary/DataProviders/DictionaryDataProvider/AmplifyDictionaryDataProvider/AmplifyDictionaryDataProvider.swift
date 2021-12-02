//
//  AmplifyDictionaryDataProvider.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 28.11.2021.
//

import Foundation
import Amplify

final class AmplifyDictionaryDataProvider: DictionaryDataProvider {
    func search(for text: String, _ completion: @escaping (Result<DictionarySearchResult, Error>) -> Void) {
        Amplify.DataStore.query(
            LexemeGraphQLModel.self,
            where: nil,
            sort: nil,
            paginate: nil) { result in
                switch result {
                case .success(let models): completion(.success(models.mapModels()))
                case .failure(let dataStoreError): print(dataStoreError)
                }
            }
    }
}
