//
//  TitleLexemeView.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 07.01.2021.
//

import SwiftUI

struct TitleLexemeView: View {
    let lexeme: Lexeme

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(lexeme.lexeme).bold()

                    if let partOfSpeech = lexeme.partOfSpeech?.rawValue {
                        Text(partOfSpeech)
                            .foregroundColor(.gray)
                            .italic()
                    }
                }

                if let transcription = lexeme.transcription, !transcription.isEmpty {
                    Text("[\(transcription)]")
                        .foregroundColor(.gray)
                }
            }

            Spacer()

            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "speaker.wave.2.circle")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
            })
        }
    }
}

struct TitleLexemeView_Previews: PreviewProvider {
    static var previews: some View {
        TitleLexemeView(lexeme: Lexeme(
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
