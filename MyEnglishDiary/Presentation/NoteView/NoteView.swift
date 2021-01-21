//
//  NoteView.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 21.01.2021.
//

import SwiftUI

struct NoteView: View {
    let note: Note

    var body: some View {
        Text("Hello, World!")
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        let note = Note(
            group: nil,
            date: Date(),
            language: Language.ENG,
            text: "First note",
            partOfSpeech: PartOfSpeech.NOUN,
            transcription: nil,
            meanings: [],
            tags: []
        )

        NoteView(note: note)
    }
}
