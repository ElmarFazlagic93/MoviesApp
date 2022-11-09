//
//  ImageLoader.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 8. 11. 2022..
//

import Foundation

class ImageLoader: ObservableObject {
    @Published var downloadedData: Data?
    
    func downloadImage (url: String) {
        
        guard let imageUrl = URL(string: url) else {
            print("Error Url not valid")
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            
            guard let data = data, error == nil else {
                print("Error with Url")
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
}
