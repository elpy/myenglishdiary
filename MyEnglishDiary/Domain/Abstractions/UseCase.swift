//
//  UseCase.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 17.12.2020.
//

import Foundation

protocol UseCase {

    associatedtype Data
    func execute(_ completion: (Result<Data, Error>) -> Void)
}
