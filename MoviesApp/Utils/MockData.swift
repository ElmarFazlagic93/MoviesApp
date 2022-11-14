//
//  MockData.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 14. 11. 2022..
//

import Foundation

struct MockData {
    
    static func getPopularMovies() -> [Movie] {
        return [
        Movie(title: "Captain Marvel",
              year: "2019",
              imdbId: "tt4154664",
              poster: "https://m.media-amazon.com/images/M/MV5BMTE0YWFmOTMtYTU2ZS00ZTIxLWE3OTEtYTNiYzBkZjViZThiXkEyXkFqcGdeQXVyODMzMzQ4OTI@._V1_SX300.jpg"),
        Movie(title: "Batman Begins",
              year: "2005",
              imdbId: "tt0372784",
              poster: "https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg"),
        Movie(title: "Inception",
              year: "2010",
              imdbId: "tt1375666",
              poster: "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg"),
        Movie(title: "Pulp Fiction",
              year: "1994",
              imdbId: "tt0110912",
              poster: "https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg"),
        Movie(title: "Fight Club",
              year: "1999",
              imdbId: "tt0137523",
              poster: "https://m.media-amazon.com/images/M/MV5BNDIzNDU0YzEtYzE5Ni00ZjlkLTk5ZjgtNjM3NWE4YzA3Nzk3XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_SX300.jpg")
        ]
    }
}
