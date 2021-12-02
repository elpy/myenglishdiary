//
//  DairyView.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 20.12.2020.
//

import SwiftUI

struct DiaryView: View {
    @ObservedObject var viewModel = DiaryViewModel()
    @State private var lastPressedCard: DiaryRecord?

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack(alignment: .center, spacing: 12) {
                        ForEach(viewModel.notes) { note in
                            NoteCard(note: note)
                                .onTapGesture {
                                    self.lastPressedCard = note
                                }
                        }
                    }.padding(.horizontal).padding(.bottom)
                }
            }
            .navigationBarTitle("Мой дневник", displayMode: .inline)
        }.sheet(item: $lastPressedCard) { note in
            LexemeView(lexeme: note.lexeme)
        }.alert(item: $viewModel.displayReadingFailure) { _ in
            Alert(title: Text("Ошибка"))
        }.onAppear {
            self.viewModel.fetchDiary()
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
