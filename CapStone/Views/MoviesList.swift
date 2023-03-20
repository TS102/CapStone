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
            List() {
                ForEach(movies, id: \.id) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        VStack {
                            Text(movie.title)
                                .font(.title)
                            Text("\(movie.releaseDate.formatted(.dateTime.day().year().month()))")
                        }
                    }
                }
                .onDelete(perform: delete)
                }
                .padding()
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
    
    
    func delete(at offsets: IndexSet) {
        movies.remove(atOffsets: offsets)
    }
    
    }

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
