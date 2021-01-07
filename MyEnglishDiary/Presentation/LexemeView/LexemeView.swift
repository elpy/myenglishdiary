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
        VStack {
            TitleLexemeView(lexeme: lexeme)

            MeaningsLexemeView(lexeme: lexeme)

            Spacer()
        }.padding()
    }
}

struct LexemeView_Previews: PreviewProvider {
    static var previews: some View {
        LexemeView(lexeme: Lexeme(
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
