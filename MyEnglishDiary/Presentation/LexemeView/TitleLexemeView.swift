//
//  TitleLexemeView.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 07.01.2021.
//

import SwiftUI

typealias MakingNewGroupHandler = () -> Void

struct TitleLexemeView: View {
    let lexeme: Lexeme

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(lexeme.text).bold()

                    if let partOfSpeech = lexeme.partOfSpeech?.rawValue {
                        Text(partOfSpeech).foregroundColor(.gray).italic()
                    }
                }

                if let transcription = lexeme.transcription, !transcription.isEmpty {
                    Text("[\(transcription)]").foregroundColor(.gray)
                }
            }

            Spacer()

            Button(action: {}, label: {
                Image(systemName: "speaker.wave.2.circle")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 30, height: 30, alignment: .center)
            })
        }
    }
}

struct TitleLexemeView_Previews: PreviewProvider {
    static var previews: some View {
        TitleLexemeView(lexeme: Lexeme(
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
