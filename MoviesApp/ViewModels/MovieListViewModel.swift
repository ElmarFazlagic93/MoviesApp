//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 12. 11. 2022..
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies = [MovieViewModel]()
    @Published var didExecuteSearch: Bool = false
    let httpClient = HTTPClient()
    
    func SearchByName(_ name: String) {
        
        if name.isEmpty {
            DispatchQueue.main.async {
                self.movies = [MovieViewModel]()
                self.didExecuteSearch = false
            }
            return
        }
        
        httpClient.getMoviesBy(search: name) { result in
            switch result {
            case .success(let moviesResult):
                if let movies = moviesResult {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                        self.didExecuteSearch = true
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.movies = [MovieViewModel]()
                    self.didExecuteSearch = true
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
