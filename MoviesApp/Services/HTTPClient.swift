//
//  HTTPClient.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 9. 11. 2022..
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class HTTPClient {
    
    func getPopularMovies(completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        // Since API doesnt support any call I mocked 5 movies and use them as Popular movies to fill Search Page until user executes a search
        // This is not acceptable in real life, but I went with it since this is just to showcase my skills on the other parts of the app
        let popularMovies = MockData.getPopularMovies()
        completion(.success(popularMovies))
    }
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        
        guard let url = URL.forMoviesByName(search) else {
            return completion(.failure(.badURL))
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else{
                return completion(.failure(.decodingError))
            }
            
            completion(.success(moviesResponse.movies))
        }
            
        dataTask.resume()
    }
    
    func getMovieDetailsBy(imdbId: String, completion: @escaping (Result<MovieDetails, NetworkError>) -> Void) {
        
        guard let url = URL.forMovieDetailsBy(imdbId: imdbId) else {
            return completion(.failure(.badURL))
        }

        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let movieDetails = try? JSONDecoder().decode(MovieDetails.self, from: data) else{
                return completion(.failure(.decodingError))
            }
            
            completion(.success(movieDetails))
        }
        
        dataTask.resume()
    }
    
    func sendRatingForMovie(rating: Rating){
        print("Rated movie with imdbId: \(rating.imdbId)")
        print(rating)
        // This is just an placeholder method
        // Here we would perform an API call to send and store the rating for a given movie
        // But since I used an existing public API I don't have that feature on the API side
    }
}
