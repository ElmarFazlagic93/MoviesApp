//
//  ViewExtensions.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 12. 11. 2022..
//

import Foundation
import SwiftUI

extension View {
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
}

struct PrimaryColorModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(Constants.Colors.PrimaryTextColor))
    }
}

struct BackgroundColorStyle: ViewModifier {

    func body(content: Content) -> some View {
        return content
            .background(Color(Constants.Colors.BackgroundColor))
    }
}
