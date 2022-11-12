//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 12. 11. 2022..
//

import SwiftUI

struct MovieDetailsView: View {
    
    @ObservedObject var movieDetailsViewModel: MovieDetatailsViewModel
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 10) {
                UrlImage(url: movieDetailsViewModel.poster)
                    .cornerRadius(10)
                
                Text(movieDetailsViewModel.title)
                    .font(.title)
                Text(movieDetailsViewModel.plot)
                Text("Director")
                    .fontWeight(.bold)
                Text(movieDetailsViewModel.director)
                
                HStack{
                    RatingView(rating: .constant(movieDetailsViewModel.rating))
                    Text("\(movieDetailsViewModel.rating)/10")
                }.padding(.top, 10)
                
                Spacer()
                
            }.padding()
            .navigationTitle(movieDetailsViewModel.title)
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let movieDetails = MovieDetails(title: "The Social Network", year: "2010", rated: "PG-13", plot: "As Harvard student Mark Zuckerberg creates the social networking site that would become known as Facebook, he is sued by the twins who claimed he stole their idea, and by the co-founder who was later squeezed out of the business.", director: "David Fincher", actors: "Jesse Eisenberg, Andrew Garfield, Justin Timberlake", imdbRating: "7.8", poster: "https://m.media-amazon.com/images/M/MV5BOGUyZDUxZjEtMmIzMC00MzlmLTg4MGItZWJmMzBhZjE0Mjc1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg", imdbId: "tt1285016")
        
        MovieDetailsView(movieDetailsViewModel: MovieDetatailsViewModel(movieDetails: movieDetails)).embedNavigationView()
    }
}
