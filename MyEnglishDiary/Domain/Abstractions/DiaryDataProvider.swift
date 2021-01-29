//
//  DiaryDataProvider.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 19.12.2020.
//

import Foundation

protocol DiaryDataProvider {
    func addNewNote(_ note: Note, _ completion: @escaping (Result<Void, Error>) -> Void)
    func addNewGroup(_ group: NotesGroup, _ completion: @escaping (Result<Void, Error>) -> Void)
    func getNotes(_ completion: @escaping (Result<[Note], Error>) -> Void)
    func getGroups(_ completion: @escaping (Result<[NotesGroup], Error>) -> Void)
    func markNote(_ note: Note, with tag: Tag, _ completion: @escaping (Result<Void, Error>) -> Void)
}
