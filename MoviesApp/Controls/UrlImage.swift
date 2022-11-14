//
//  UrlImage.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 8. 11. 2022..
//

import SwiftUI

struct UrlImage: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    var fetchUIImage: UIImage? {
        get {
            if let data = self.imageLoader.downloadedData, let image = UIImage(data: data) {
                return image
            }
            
            return nil
        }
    }
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let image = fetchUIImage {
            return Image(uiImage: image)
                .resizable()
        }
        else{
            return Image(self.placeholder)
                .resizable()
        }
    }
}

struct UrlImage_Previews: PreviewProvider {
    static var previews: some View {
        UrlImage(url: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg")
    }
}
