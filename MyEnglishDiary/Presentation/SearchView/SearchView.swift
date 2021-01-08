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
        VStack {
            SearchInput(text: $viewModel.text, placeholder: "Поиск")

            List(viewModel.searchResult) { result in
                SearchResultCard(lexeme: result)
                    .onTapGesture {
                        self.lastPressedCard = result
                    }
            }
            .sheet(item: $lastPressedCard) { result in
                NavigationView {
                    LexemeView(lexeme: result)
                        .navigationBarItems(trailing: Button("Добавить в дневник", action: {}))
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
