//
//  MovieDetail.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 12. 11. 2022..
//

import Foundation

struct MovieDetails: Codable {
    let title: String
    let year: String
    let rated: String
    let plot: String
    let director: String
    let actors: String
    let imdbRating: String
    let poster: String
    let imdbId: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case plot = "Plot"
        case director = "Director"
        case actors = "Actors"
        case imdbRating = "imdbRating"
        case poster = "Poster"
        case imdbId = "imdbID"
    }
}
