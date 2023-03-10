//
//  MovieDetailView.swift
//  CapStone
//
//  Created by Tyler Sun on 3/10/23.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
                
                VStack(spacing: 20) {
                    Text(movie.description)
                        .padding()
                        .border(.blue)
                        
                    Text(movie.myReview)
                        .padding()
                        .border(.black, width: 3)
                }
            }
        }
        .navigationTitle(movie.title)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: MoviesWatch.moviesWatched.first!)
    }
}
