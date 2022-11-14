//
//  MovieListScreen.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 12. 11. 2022..
//

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var movieListViewModel = MovieListViewModel()
    @State private var movieName: String = ""
    
    var body: some View {
        VStack {
            TextField("Search", text: $movieName, onEditingChanged: { _ in }, onCommit: {
                self.movieListViewModel.searchByName(self.movieName)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal, 8)
            
            Spacer()
            
            MovieListView(movies: self.movieListViewModel.movies)
                .navigationTitle("Movies")
                .modifier(BackgroundColorStyle())
            
            Spacer()
        }
        .modifier(BackgroundColorStyle())
        .embedNavigationView()
        
        .onAppear() {
            self.movieListViewModel.getPopularMovies()
        }
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieListScreen()
        }
    }
}
