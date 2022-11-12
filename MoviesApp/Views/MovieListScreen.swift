//
//  MovieListScreen.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 12. 11. 2022..
//

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var movieListViewModel: MovieListViewModel
    @State private var movieName: String = ""
    
    init() {
        self.movieListViewModel = MovieListViewModel()
    }
    
    var body: some View {
        VStack {
            
            TextField("Search", text: $movieName, onEditingChanged: { _ in }, onCommit: {
                self.movieListViewModel.SearchByName(self.movieName)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.leading, 8)
            .padding(.trailing, 8)
            
            Spacer()
            
            MovieListView(movies: self.movieListViewModel.movies, didExecuteSearch: movieListViewModel.didExecuteSearch)
                .navigationTitle("Movies")
            
            Spacer()
        }.embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
