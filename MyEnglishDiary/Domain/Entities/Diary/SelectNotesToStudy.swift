//
//  SelectNotesToStudy.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.11.2020.
//

import Foundation

protocol NotesSelectionStrategy {

}

protocol Studying {
    func selectNotesToStudy(with strategy: NotesSelectionStrategy, from group: Group?) -> [Note]
}
