//
//  SearchView.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 20.12.2020.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()

    var body: some View {
        VStack {
            SearchInput(text: $viewModel.text, placeholder: "Поиск")
            List(viewModel.searchResult) { result in
                SearchResultCard(result: result)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
