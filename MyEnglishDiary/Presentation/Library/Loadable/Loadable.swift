//
//  Loadable.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 29.01.2021.
//

import SwiftUI

enum LoadingState<T> {
    case loading
    case loaded(T)
    case updating(T)
    case failed(Error)
}

struct Loadable<T, Content: View>: View {
    let state: LoadingState<T>
    let content: (T) -> Content

    init(state: LoadingState<T>, @ViewBuilder content: @escaping (T) -> Content) {
        self.state = state
        self.content = content
    }

    var body: some View {
        switch state {
        case .loading: return AnyView(loadingIndicator)
        case .loaded(let value), .updating(let value): return AnyView(content(value))
        case .failed: return AnyView(failureIndicator)
        }
    }

    var loadingIndicator: some View {
        VStack {
            Spacer()
            ActivityIndicator(isAnimating: .constant(true))
            Spacer()
        }
    }

    var failureIndicator: some View {
        VStack {
            Spacer()
            Text("Error loading view")
            Spacer()
        }
    }
}

struct Loadable_Previews: PreviewProvider {
    static var previews: some View {
        Loadable(state: .loading) { (value: String) in
            Text("preview \(value)")
        }
    }
}
