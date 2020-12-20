//
//  DictionaryDataProvider.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 19.12.2020.
//

import Foundation

protocol DictionaryDataProvider {
    func search(for text: String) throws -> [Lexeme]
}
