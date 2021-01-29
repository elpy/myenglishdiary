//
//  SearchView.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 20.12.2020.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    @State private var displayLexemeViewFor: Lexeme?

    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            SearchInput(text: $viewModel.text, placeholder: "Поиск")

            Loadable(state: viewModel.searchState) { (lexemes: DictionarySearchResult) in
                ZStack {
                    ScrollView {
                        LazyVStack(alignment: .center, spacing: 12) {
                            ForEach(lexemes) { lexeme in
                                SearchResultCard(
                                    lexeme: lexeme,
                                    inDiary: viewModel.lexemeIdsInDiary.contains(lexeme.id)
                                ).onTapGesture {
                                    self.displayLexemeViewFor = lexeme
                                }
                            }
                        }.padding(.horizontal).padding(.bottom)
                    }

                    if lexemes.isEmpty, !viewModel.text.isEmpty {
                        VStack {
                            Spacer()
                            Text("По запросу «\(viewModel.text)» ничего не найдено")
                            Spacer()
                        }
                    }
                }
            }
        }.sheet(item: $displayLexemeViewFor) { lexeme in
            LexemeView(lexeme: lexeme)
        }.onAppear {
            viewModel.fetchDiary()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
