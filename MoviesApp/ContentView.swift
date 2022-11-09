//
//  ContentView.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 8. 11. 2022..
//

import SwiftUI

struct ContentView: View {
    
    @State private var rating: Int?
    var body: some View {
        VStack {
            RatingView(rating: $rating)
            Text(rating != nil ? "Your rating: \(rating!)" : "")
        }
        
            .onAppear {
                HTTPClient().getMoviesBy(search: "marvel") { result in
                    switch result {
                    case .success(let movies):
                        print(movies)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
