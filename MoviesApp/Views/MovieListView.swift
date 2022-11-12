//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 12. 11. 2022..
//

import SwiftUI

struct MovieListView: View {
    
    let movies: [MovieViewModel]
    var didExecuteSearch: Bool = false
    
    var body: some View {
        if movies.count == 0 {
            if self.didExecuteSearch {
                Text("No movies found!")
            }
            else {
                Text("Type in the movie name to search for movies")
            }
        }
        else {            
            List(self.movies, id: \.imdbId) { movie in
                NavigationLink(destination: MovieDetailsScreen(imdbId: movie.imdbId)) {
                    MovieCellView(movie: movie)
                }
            }
        }
    }
}

struct MovieCellView: View {
    let movie: MovieViewModel
    
    var body: some View {
        HStack (alignment: .top) {
            UrlImage(url: movie.poster)
                .frame(width: 100, height: 120)
                .cornerRadius(6)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 2)
            }.padding(5)
            Spacer()
        }.contentShape(Rectangle())
    }
}
