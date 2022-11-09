//
//  URLExtensions.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 9. 11. 2022..
//

import Foundation

extension URL {
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?s=\(name)&apikey=\(Constants.API_KEY)")
    }
}
