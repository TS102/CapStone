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
            
            VStack(spacing: 40) {
                Text(movie.title ?? "Title").font(.title2).bold().underline(pattern: .solid)

                VStack {
                    VStack(spacing: 15) {
                        
                        Text("Release Date: \(movie.releaseDate?.formatted(.dateTime.year().month()) ?? Date.distantPast.formatted())")
                        
                        Text("Genre: \(movie.genre ?? "Genre")" )
                        
                        Text("My rating \(movie.rating.formatted())%")
                    }
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
        }.toolbar {
            ShareLink(item: "\(movie.myReview ?? "Review has not been made")", subject: Text("My movie review"), message: Text("My review of \(movie.title ?? "Movie title)")"))
        }
        .ignoresSafeArea()
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            MovieDetailView(movie: Mov)
//        }
//    }
//}
