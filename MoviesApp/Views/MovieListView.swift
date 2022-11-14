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
                VStack {
                    Image(systemName: "x.circle")
                        .font(.system(size: 56.0))
                        .modifier(PrimaryColorModifier())
                        .padding(.bottom, 16)
                          
                    Text("No movies found!")
                        .modifier(PrimaryColorModifier())
                }
            }
            else {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 56.0))
                        .modifier(PrimaryColorModifier())
                        .padding(.bottom, 16)
                    
                    Text("Type in the movie name to search for movies")
                        .modifier(PrimaryColorModifier())
                }
            }
        }
        else {            
            List(self.movies, id: \.imdbId) { movie in
                NavigationLink(destination: MovieDetailsScreen(imdbId: movie.imdbId)) {
                    MovieCellView(movie: movie)
                }
                .listRowSeparatorTint(Color(Constants.Colors.SeparatorColor))
                .listRowBackground(Color(Constants.Colors.LightBackgroundColor))
            }
            .background(Color(Constants.Colors.BackgroundColor))
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
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
                    .modifier(PrimaryColorModifier())
                
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 2)
                    .modifier(PrimaryColorModifier())
            }.padding(5)
            Spacer()
        }
        .contentShape(Rectangle())
    }
}
