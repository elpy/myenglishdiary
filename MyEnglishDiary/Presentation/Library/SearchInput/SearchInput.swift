//
//  SearchInput.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 24.12.2020.
//

import SwiftUI

struct SearchInput: UIViewRepresentable {
    @Binding var text: String
    let placeholder: String

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        searchBar.placeholder = self.placeholder
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator($text)
    }

    // MARK: Coordinator

    class Coordinator: NSObject, UISearchBarDelegate {

        private var text: Binding<String>

        init(_ text: Binding<String>) {
            self.text = text
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text.wrappedValue = searchText
        }
    }
}

struct SearchInput_Previews: PreviewProvider {
    static var previews: some View {
        SearchInput(text: .constant("Test"), placeholder: "Поиск")
    }
}
