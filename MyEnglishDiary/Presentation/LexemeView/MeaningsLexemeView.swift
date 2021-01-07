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
            ForEach(meaningsWithExamples, id: \.meaning) { meaning in
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(meaning.meaning.capitalized).font(.subheadline)

                        ForEach(meaning.examples, id: \.example) { example in
                            VStack(alignment: .leading) {
                                Text(example.example).font(.caption)

                                Text(example.meaning).font(.footnote)
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
        ))
    }
}
