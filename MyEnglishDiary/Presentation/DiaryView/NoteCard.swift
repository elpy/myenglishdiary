//
//  NoteCard.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 20.01.2021.
//

import SwiftUI

struct NoteCard: View {
    let note: Note

    var body: some View {
        GroupBox(
            label: Label(note.text, systemImage: "star"),
            content: {
                HStack(alignment: .center, spacing: nil, content: {
                    VStack(alignment: .leading, spacing: nil, content: {
                        Text("anything else")
                            .italic()
                    })

                    Spacer()
                })
            }
        )
    }
}

struct NoteCard_Previews: PreviewProvider {
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

        NoteCard(note: note)
    }
}
