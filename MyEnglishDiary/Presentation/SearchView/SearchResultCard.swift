//
//  SearchResultCard.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 25.12.2020.
//

import SwiftUI

struct SearchResultCard: View {
    let result: Lexeme

    var body: some View {
        GroupBox(
            label: Label(result.lexeme, systemImage: "heart"),
            content: {
                HStack(alignment: .center, spacing: nil, content: {
                    VStack(alignment: .leading, spacing: nil, content: {
                        if let partOfSpeech = result.partOfSpeech?.rawValue {
                            Text(partOfSpeech)
                                .foregroundColor(.gray)
                                .italic()
                        }

                        if let transcription = result.transcription, !transcription.isEmpty {
                            Text("[\(transcription)]")
                                .foregroundColor(.gray)
                        }

                        Text(result.meanings.asString())
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
            lexeme: "lounge",
            partOfSpeech: PartOfSpeech.VERB,
            transcription: "laʊnʤ",
            meanings: [
                Meaning(
                    meaning: "бездельничать",
                    lexemesWithSimilarMeaning: ["sit"],
                    examples: []
                )
            ]
        )

        SearchResultCard(result: result)
            .padding()
    }
}
