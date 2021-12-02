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
                            Text("[\(transcription.first!)]").foregroundColor(.gray)
                        }

                        Text(lexeme.translations.asString()).italic()
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
            id: "LEXEME_1",
            language: Language.english,
            text: "lounge",
            partOfSpeech: PartOfSpeech.VERB,
            transcription: ["laʊnʤ"],
            forms: [],
            translations: [
                LexemeTranslation(
                    id: "TRANSLATION_1",
                    text: "бездельничать",
                    tip: nil,
                    examples: [],
                    tags: []
                )
            ],
            lessCommonTranslations: []
        )

        SearchResultCard(lexeme: result, inDiary: true).padding()
    }
}
