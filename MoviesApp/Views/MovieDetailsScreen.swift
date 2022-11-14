//
//  MovieDetailsScreen.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 12. 11. 2022..
//

import SwiftUI

struct MovieDetailsScreen: View {
    
    @ObservedObject private var movieDetailsViewModel = MovieDetatailsViewModel()
    let imdbId: String
    
    var body: some View {
        VStack{
            MovieDetailsView(movieDetailsViewModel: movieDetailsViewModel)
        }
        .onAppear {
            self.movieDetailsViewModel.getDetailsBy(imdbId: self.imdbId)
        }
        .modifier(BackgroundColorStyle())
    }
}

struct MovieDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsScreen(imdbId: "tt1285016")
    }
}
