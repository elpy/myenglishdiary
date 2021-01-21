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
            content: {
                HStack(alignment: .center, spacing: nil, content: {
                    VStack(alignment: .leading, spacing: 6, content: {
                        HStack {
                            Label(note.text, systemImage: "star").font(.headline)

                            if let partOfSpeech = note.partOfSpeech?.rawValue {
                                Text(partOfSpeech)
                                    .foregroundColor(.gray)
                                    .italic()
                            }
                        }

                        Text(info)
                            .foregroundColor(.gray)
                            .font(Font.footnote)
                            .italic()
                    })

                    Spacer()
                })
            }
        )
    }

    private var info: String {
        let locale = Locale(identifier: Locale.preferredLanguages.first ?? Locale.current.identifier)
        let noteYear = Calendar.current.dateComponents([.year], from: note.date).year ?? 0
        let currentYear = Calendar.current.dateComponents([.year], from: Date()).year ?? 0
        let template = noteYear == currentYear ? "dd MMMM" : "dd MMMM yyyy"

        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = template

        if let group = note.group {
            return "Добавлено \(formatter.string(from: note.date)) в «\(group.name)»"
        } else {
            return "Добавлено \(formatter.string(from: note.date))"
        }
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
