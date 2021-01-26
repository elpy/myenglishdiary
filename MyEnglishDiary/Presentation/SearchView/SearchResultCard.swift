//
//  SearchResultCard.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 25.12.2020.
//

import SwiftUI

struct SearchResultCard: View {
    let lexeme: Lexeme
    let inDiary: Bool

    var body: some View {
        GroupBox(
            content: {
                HStack(alignment: .center, spacing: nil, content: {
                    VStack(alignment: .leading, spacing: 2, content: {
                        HStack {
                            Label(lexeme.text, systemImage: inDiary ? "heart.fill" : "heart").font(Font.headline)

                            if let partOfSpeech = lexeme.partOfSpeech?.rawValue {
                                Text(partOfSpeech).foregroundColor(.gray).italic()
                            }
                        }

                        if let transcription = lexeme.transcription, !transcription.isEmpty {
                            Text("[\(transcription)]").foregroundColor(.gray)
                        }

                        Text(lexeme.meanings.asString()).italic()
                    })

                    Spacer()
                })
            }
        )
    }
}

struct SearchResultCard_Previews: PreviewProvider {
    static var previews: some View {
        let result = Lexeme(
            language: Language.ENG,
            text: "lounge",
            partOfSpeech: PartOfSpeech.VERB,
            transcription: "laʊnʤ",
            meanings: [
                Meaning(
                    text: "бездельничать",
                    lexemesWithSimilarMeaning: ["sit"],
                    examples: []
                )
            ]
        )

        SearchResultCard(lexeme: result, inDiary: true).padding()
    }
}
