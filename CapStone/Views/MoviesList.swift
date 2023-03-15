//
//  MoviesList.swift
//  CapStone
//
//  Created by Tyler Sun on 3/10/23.
//

import SwiftUI

struct MovieListView: View {
    @State var movies: [Movie] = MoviesWatch.moviesWatched
    
    var startPoint = UnitPoint.topLeading
    var endPoint = UnitPoint.bottomTrailing
    
    var body: some View {
        
            List(movies, id: \.id) { movie in
                NavigationLink {
                    MovieDetailView(movie: movie)
                } label: {
                    VStack {
                        
                        Text(movie.title)
                            .font(.largeTitle)
                            .fontWeight(.ultraLight)
                            
                        Text(movie.releaseDate)
                            .lineLimit(1)
                            .fixedSize()
                    }
                }
                .padding()
            }
            .background {
                LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: startPoint, endPoint: endPoint)
            }
            .scrollContentBackground(.hidden)
            .toolbar {
                NavigationLink(destination: AddMovieView(movies: $movies), label: { Text("ADD")})
                
            
            }
            .navigationTitle("Movie List")
            .background(LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: startPoint, endPoint: endPoint))
            }
    }

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
