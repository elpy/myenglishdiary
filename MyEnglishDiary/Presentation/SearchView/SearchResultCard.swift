//
//  SearchResultCard.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 25.12.2020.
//

import SwiftUI

struct SearchResultCard: View {
    let lexeme: Lexeme

    var body: some View {
        GroupBox(
            label: Label(lexeme.text, systemImage: "heart"),
            content: {
                HStack(alignment: .center, spacing: nil, content: {
                    VStack(alignment: .leading, spacing: nil, content: {
                        if let partOfSpeech = lexeme.partOfSpeech?.rawValue {
                            Text(partOfSpeech)
                                .foregroundColor(.gray)
                                .italic()
                        }

                        if let transcription = lexeme.transcription, !transcription.isEmpty {
                            Text("[\(transcription)]")
                                .foregroundColor(.gray)
                        }

                        Text(lexeme.meanings.asString())
                            .italic()
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

        SearchResultCard(lexeme: result)
            .padding()
    }
}
