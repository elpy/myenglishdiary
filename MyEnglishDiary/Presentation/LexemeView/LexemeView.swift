//
//  LexemeView.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 07.01.2021.
//

import SwiftUI

struct LexemeView: View {
    @ObservedObject var viewModel: LexemeViewModel
    @State private var presentingPlacementSheet = false

    init(lexeme: Lexeme) {
        viewModel = LexemeViewModel(lexeme: lexeme)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    TitleLexemeView(lexeme: viewModel.lexeme)
                    MeaningsLexemeView(lexeme: viewModel.lexeme)
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Text(viewModel.noteBasedOnLexeme == nil ? "" : "В дневнике"),
                trailing:
                    HStack {
                        if viewModel.noteBasedOnLexeme == nil {
                            Button("Добавить в дневник", action: {
                                presentingPlacementSheet.toggle()
                            })
                        }
                    }
            )
        }
        .notePlacementSelectionSheet(groups: viewModel.groups, isPresented: $presentingPlacementSheet) { placement in
            viewModel.makeNote(placement: placement)
        }
        .onAppear {
            viewModel.fetchDiary()
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
