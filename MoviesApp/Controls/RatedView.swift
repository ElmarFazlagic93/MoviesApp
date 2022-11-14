//
//  RatedView.swift
//  MoviesApp
//
//  Created by Elmar Fazlagic on 14. 11. 2022..
//

import SwiftUI

struct RatedView: View {
    @Binding var rated: String
    
    var shouldShowRated: Bool {
        !rated.isEmpty && rated != "Not Rated" && rated != "Unrated" && rated != "N/A"
    }
    
    var body: some View {
        if shouldShowRated {
            ZStack {
                Capsule()
                    .fill(.orange)
                    .frame(width: 80, height: 30)
                Text(rated)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
            }
        }
    }
}

struct RatedView_Previews: PreviewProvider {
    static var previews: some View {
        RatedView(rated: .constant("PG-13"))
            .previewLayout(.sizeThatFits)
    }
}
