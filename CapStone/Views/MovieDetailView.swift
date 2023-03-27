//
//  MovieDetailView.swift
//  CapStone
//
//  Created by Tyler Sun on 3/10/23.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movies
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topTrailing, endPoint: .bottomLeading)
            
            VStack(spacing:110) {
                HStack(spacing: 50) {
                    
                    Text("\(movie.releaseDate?.formatted(.dateTime.day().year().month()) ?? Date.distantPast.formatted())")
                 
                    Text(movie.genre ?? "genre")
                }
                VStack() {
                    Text("Desciption")
                        .font(.title)
                    Text(movie.movieDescription ?? "Description")
                        .padding()
                        .border(.black)
                }
                VStack {
                    Text("My Thoughts")
                        .font(.title)
                    Text(movie.myReview ?? "my review")
                        .padding()
                        .border(.black)
                }
            }
        }
        .ignoresSafeArea()
        .navigationTitle(movie.title ?? "Movie Title")
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            MovieDetailView(movie: )
//        }
//    }
//}
