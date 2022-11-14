//
//  RatingScreen.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 14. 11. 2022..
//

import SwiftUI

struct RatingScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var ratingViewModel: RatingViewModel
    var imdbId: String
    var movieTitle: String
    @State var text: String = "Write your comment here..."
    @State var rating: Int? = 0
    
    private let placeholderText = "Write your comment here..."
    
    init (imdbId: String, movieTitle: String) {
        self.imdbId = imdbId
        self.movieTitle = movieTitle
        ratingViewModel = RatingViewModel(imdbId: imdbId, movieTitle: movieTitle)
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(movieTitle)
                .font(.system(size: 36))
                .padding(.bottom, 10)
            
            Text("Comment")
            
            ZStack{
                TextEditor(text: $text)
                    .frame(height: 200)
                    .foregroundColor(self.text == placeholderText ? .gray : Color(Constants.Colors.PrimaryTextColor))
                    .onTapGesture {
                        if self.text == placeholderText {
                            self.text = ""
                        }
                    }
            }
            
            HStack{
                Spacer()
                VStack {
                    Text("Rating").padding(.top, 20)
                    RatingView(rating: $rating)
                        .padding(.top, 5)
                    Text("\(rating ?? 0)/10")
                        .font(.system(size: 20))
                        .padding(.top, 10)
                }
                Spacer()
            }
            
            Spacer()
            
            HStack{
                Spacer()
                Button("Rate") {
                    if !text.isEmpty, text != placeholderText, let ratingNum = rating {
                        ratingViewModel.addRating(text: text, rating: ratingNum)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                Spacer()
            }
        }.padding()
            .modifier(BackgroundColorStyle())
    }
}

struct RatingScreen_Previews: PreviewProvider {
    static var previews: some View {
        RatingScreen(imdbId: "i123123", movieTitle: "Captain Marvel")
    }
}
