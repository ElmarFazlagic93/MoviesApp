//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 12. 11. 2022..
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies = [MovieViewModel]()
    let httpClient = HTTPClient()
    
    func getPopularMovies() {
        httpClient.getPopularMovies { result in
            switch result {
            case .success(let moviesResult):
                if let movies = moviesResult {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.movies = [MovieViewModel]()
                }
            }
        }
    }
    
    func searchByName(_ name: String) {
        
        if name.isEmpty {
            self.getPopularMovies()
            return
        }
        
        httpClient.getMoviesBy(search: name) { result in
            switch result {
            case .success(let moviesResult):
                if let movies = moviesResult {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.movies = [MovieViewModel]()
                }
            }
        }
    }
}

struct MovieViewModel {
    let movie: Movie
    
    var imdbId: String {
        return movie.imdbId
    }
    
    var title: String {
        return movie.title
    }
    
    var poster: String {
        return movie.poster
    }
    
    var year: String {
        return movie.year
    }
}
