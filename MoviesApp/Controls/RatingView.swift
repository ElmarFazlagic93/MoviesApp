//
//  RatingView.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 8. 11. 2022..
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int?
    
    private func starType(_ index: Int) -> String {
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        }
        else {
            return "star"
        }
    }
    
    var body: some View {
        HStack{
            ForEach(1...10, id: \.self) { index in
                Image(systemName: self.starType(index))
                    .foregroundColor(.orange)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
}

struct RatingVIew_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(5)).previewLayout(.sizeThatFits)
    }
}
