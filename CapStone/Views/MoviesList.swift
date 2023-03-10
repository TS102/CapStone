//
//  MoviesList.swift
//  CapStone
//
//  Created by Tyler Sun on 3/10/23.
//

import SwiftUI

struct MovieListView: View {

    var movies: [Movie] = MoviesWatch.moviesWatched
    
    var body: some View {
        
        NavigationStack {
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
                LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
            }
            .scrollContentBackground(.hidden)
            .toolbar {
                Button("Add") {}
            }
            .navigationTitle("Movie List")
            }
        }
    }

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
