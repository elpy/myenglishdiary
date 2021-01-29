//
//  ActivityIndicator.swift
//  MyEnglishDiary
//
//  Created by Антон Скворцов on 29.01.2021.
//

import UIKit
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style = .large

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        return isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
