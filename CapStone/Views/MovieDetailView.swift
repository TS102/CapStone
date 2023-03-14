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
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topTrailing, endPoint: .bottomLeading)
            
            VStack(spacing:110) {
                HStack(spacing: 50) {
                    Text("Release Date: \(movie.releaseDate)")
                    Text("Genre: \(movie.genre)")
                }
                VStack() {
                    Text("Desciption")
                        .font(.title)
                    Text(movie.description)
                        .padding()
                        .border(.black)
                }
                VStack {
                    Text("My Thoughts")
                        .font(.title)
                    Text(movie.myReview)
                        .padding()
                        .border(.black)
                }
            }
        }
        .ignoresSafeArea()
        .navigationTitle(movie.title)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailView(movie: MoviesWatch.moviesWatched.first!)
        }
    }
}
