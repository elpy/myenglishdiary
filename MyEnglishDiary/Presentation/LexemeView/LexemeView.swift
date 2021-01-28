//
//  LexemeView.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 07.01.2021.
//

import SwiftUI

fileprivate enum LexemeViewSegments: String {
    case dictionary
    case external
    case studying
}

struct LexemeView: View {
    @ObservedObject var viewModel: LexemeViewModel
    @State private var presentingPlacementSheet = false
    @State private var segment = LexemeViewSegments.dictionary

    init(lexeme: Lexeme) {
        viewModel = LexemeViewModel(lexeme: lexeme)
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TitleLexemeView(lexeme: viewModel.lexeme)

                Picker(selection: $segment, label: Text("What is your favorite color?")) {
                    Text("Словарь").tag(LexemeViewSegments.dictionary)
                    Text("Дополнительно").tag(LexemeViewSegments.external)

                    if viewModel.noteBasedOnLexeme != nil {
                        Text("Повторения").tag(LexemeViewSegments.studying)
                    }
                }.pickerStyle(SegmentedPickerStyle())

                if case .dictionary = segment {
                    ScrollView {
                        MeaningsLexemeView(lexeme: viewModel.lexeme)
                    }
                }

                if case .external = segment {
                    VStack {
                        HStack { Spacer() }
                        Spacer()
                        Text("Нет данных")
                        Spacer()
                    }
                }

                if case .studying = segment {
                    VStack {
                        HStack { Spacer() }
                        Spacer()
                        Text("Нет данных")
                        Spacer()
                    }
                }
            }.padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Text(viewModel.title),
                trailing:
                    HStack {
                        if viewModel.noteBasedOnLexeme == nil {
                            Button("Добавить в дневник", action: {
                                presentingPlacementSheet.toggle()
                            })
                        }
                    }
            )
        }.notePlacementSelectionSheet(groups: viewModel.groups, isPresented: $presentingPlacementSheet) { placement in
            viewModel.makeNote(placement: placement)
        }.onAppear {
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
