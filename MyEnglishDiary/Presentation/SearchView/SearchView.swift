//
//  SearchView.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 20.12.2020.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    @State private var lastPressedCard: Lexeme?

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            SearchInput(text: $viewModel.text, placeholder: "Поиск")

            if viewModel.emptyResult {
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
                                    self.lastPressedCard = lexeme
                                }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
        }.sheet(item: $lastPressedCard) { result in
            NavigationView {
                LexemeView(lexeme: result)
                    .navigationBarItems(trailing: Button("Добавить в дневник", action: {}))
                    .navigationBarTitleDisplayMode(.inline)
            }
        }.alert(item: $viewModel.searchFailure) { _ in
            Alert(title: Text("Ошибка поиска"))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
