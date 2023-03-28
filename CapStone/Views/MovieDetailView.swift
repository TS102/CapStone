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
            LinearGradient(gradient: Gradient(colors: [.gray, .clear, .white, .gray]), startPoint: .topTrailing, endPoint: .bottomLeading)
            
            VStack(spacing:110) {
                HStack(spacing: 55) {
                    
                    Text("\(movie.releaseDate?.formatted(.dateTime.day().year().month()) ?? Date.distantPast.formatted())")
                 
                    Text(movie.genre ?? "genre")
                    
                    Text("\(movie.rating.formatted())%")
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
