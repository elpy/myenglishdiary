//
//  MeaningsLexemeView.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 07.01.2021.
//

import SwiftUI

struct MeaningsLexemeView: View {
    let lexeme: Lexeme
    var meaningsWithExamples: [Meaning] {
        lexeme.meanings.filter { !$0.examples.isEmpty }
    }
    var meanings: [Meaning] {
        lexeme.meanings.filter { $0.examples.isEmpty }
    }

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(meaningsWithExamples, id: \.text) { meaning in
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(meaning.text.capitalized).font(.subheadline)

                        ForEach(meaning.examples, id: \.text) { example in
                            VStack(alignment: .leading) {
                                Text(example.text).font(.caption)
                                Text(example.meaning).font(.caption)
                            }.padding(Edge.Set.leading, 5)
                        }.padding(2)
                    }

                    Spacer()
                }
            }

            HStack {
                Text(meanings.asString().capitalized).font(.subheadline)

                Spacer()
            }
        }
    }
}

struct MeaningsLexemeView_Previews: PreviewProvider {
    static var previews: some View {
        MeaningsLexemeView(lexeme: Lexeme(
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
        ))
    }
}
