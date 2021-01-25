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
    @State private var presentingGroupsActionSheet = false

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
        }.sheet(item: $displayLexemeViewFor) { lexeme in
            NavigationView {
                LexemeView(lexeme: lexeme)
                    .navigationBarItems(trailing: Button("Добавить в дневник", action: { self.presentingGroupsActionSheet.toggle() }))
                    .navigationBarTitleDisplayMode(.inline)
                    .makingNoteActionSheet(groups: viewModel.groups, isPresented: $presentingGroupsActionSheet) { placement in
                        guard let lexeme =  self.displayLexemeViewFor else { return }
                        self.viewModel.makeNote(lexeme: lexeme, placement: placement) {
                            self.displayLexemeViewFor = nil
                        }
                    }
            }
        }.alert(item: $viewModel.displaySearchFailure) { _ in
            Alert(title: Text("Ошибка поиска"))
        }.onAppear {
            viewModel.fetchGroups()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
