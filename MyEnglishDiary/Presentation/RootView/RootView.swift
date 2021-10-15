//
//  ContentView.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 12.11.2020.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem({
                    VStack {
                        Text("Поиск")
                        Image(systemName: "doc.text.magnifyingglass")
                            .font(Font.system(size: 24.0))
                    }
                }).tag(0)

            StudyingView()
                .tabItem({
                    VStack {
                        Text("Повторение")
                        Image(systemName: "graduationcap.fill")
                            .font(Font.system(size: 24.0))
                    }
                }).tag(1)

            DiaryView()
                .tabItem({
                    VStack {
                        Text("Дневник")
                        Image(systemName: "book.fill")
                            .font(Font.system(size: 24.0))
                    }
                }).tag(2)
        }
    }

    init() {
        Theming.enhanceUIKitAppearance()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
