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
        VStack(alignment: .center, spacing: 0) {
            SearchInput(text: $viewModel.text, placeholder: "Поиск")

            if viewModel.displayEmptyResultMessage {
                VStack {
                    Spacer()
                    Text("По запросу «\(viewModel.text)» ничего не найдено")
                    Spacer()
                }
            } else {
                ScrollView {
                    LazyVStack(alignment: .center, spacing: 12) {
                        ForEach(viewModel.searchResult) { lexeme in
                            SearchResultCard(lexeme: lexeme)
                            .onTapGesture {
                                self.displayLexemeViewFor = lexeme
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
        }
        .sheet(item: $displayLexemeViewFor) { lexeme in
            LexemeView(lexeme: lexeme)
        }
        .alert(item: $viewModel.displaySearchFailure) { _ in
            Alert(title: Text("Ошибка поиска"))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
