//
//  LexemeView.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 07.01.2021.
//

import SwiftUI

struct LexemeView: View {
    let lexeme: Lexeme
    @ObservedObject var viewModel = LexemeViewModel()
    @State private var presentingPlacementSheet = false

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    TitleLexemeView(lexeme: lexeme)
                    MeaningsLexemeView(lexeme: lexeme)
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Добавить в дневник", action: { presentingPlacementSheet.toggle() }))

        }
        .notePlacementSelectionSheet(groups: viewModel.groups, isPresented: $presentingPlacementSheet) { placement in
            viewModel.makeNote(lexeme: lexeme, placement: placement)
        }
        .onAppear {
            viewModel.fetchGroups()
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
