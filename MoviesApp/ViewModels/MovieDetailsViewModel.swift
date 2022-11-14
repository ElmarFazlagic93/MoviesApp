//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 12. 11. 2022..
//

import Foundation

class MovieDetatailsViewModel: ObservableObject {
    
    @Published private var movieDetails: MovieDetails?
    private var httpClient = HTTPClient()
    
    init(movieDetails: MovieDetails? = nil) {
        self.movieDetails = movieDetails
    }
    
    func getDetailsBy(imdbId: String) {
        httpClient.getMovieDetailsBy(imdbId: imdbId) { result in
            switch result {
            case .success(let movieDetails):
                DispatchQueue.main.async {
                    self.movieDetails = movieDetails
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    var imdbId: String {
        self.movieDetails?.imdbId ?? ""
    }
    
    var title: String {
        self.movieDetails?.title ?? ""
    }
    
    var poster: String {
        self.movieDetails?.poster ?? ""
    }
    
    var plot: String {
        self.movieDetails?.plot ?? ""
    }
    
    var rating: Int {
        get {
            let ratingAsDouble = Double(self.movieDetails?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
    
    var director: String {
        self.movieDetails?.director ?? ""
    }
    
    var rated: String {
        self.movieDetails?.rated ?? ""
    }
}
