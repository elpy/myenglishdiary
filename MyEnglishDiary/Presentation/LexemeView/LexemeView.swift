//
//  LexemeView.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 07.01.2021.
//

import SwiftUI

struct LexemeView: View {
    let lexeme: Lexeme

    var body: some View {
        ScrollView {
            LazyVStack {
                TitleLexemeView(lexeme: lexeme)
                MeaningsLexemeView(lexeme: lexeme)
            }.padding()
        }
    }
}

struct LexemeView_Previews: PreviewProvider {
    static var previews: some View {
        LexemeView(lexeme: Lexeme(
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
