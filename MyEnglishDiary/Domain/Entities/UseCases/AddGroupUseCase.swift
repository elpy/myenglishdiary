//
//  AddGroupUseCase.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.11.2020.
//

import Foundation

protocol AddGroupUseCase: UseCase {

    init(named name: String)
    func execute(completion handler: (Result<Group, Error>) -> Void)
}
