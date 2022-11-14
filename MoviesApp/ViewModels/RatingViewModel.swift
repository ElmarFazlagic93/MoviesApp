//
//  RatingViewModel.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 14. 11. 2022..
//

import Foundation

class RatingViewModel: ObservableObject {
 
    private var httpClient = HTTPClient()
    @Published var rating: Rating?
    var imdbId: String
    var movieTitle: String
    
    init(imdbId: String, movieTitle: String) {
        self.imdbId = imdbId
        self.movieTitle = movieTitle
    }
    
    func addRating(text: String, rating: Int) {
        let rating = Rating(imdbId: imdbId, text: text, ratingNumber: rating)
        
        httpClient.sendRatingForMovie(rating: rating)
    }
    
}
