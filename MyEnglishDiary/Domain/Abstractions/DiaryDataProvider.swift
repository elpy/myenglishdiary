//
//  DiaryDataProvider.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 19.12.2020.
//

import Foundation

protocol DiaryDataProvider {
    func addNewNote(_ note: Note) throws
    func addNewGroup(_ group: Group) throws
    func getNotes() throws -> [Note]
    func getGroups() throws -> [Group]
    func markNote(_ note: Note, with tag: Tag) throws
}
