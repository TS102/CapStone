//
//  MoviesList.swift
//  CapStone
//
//  Created by Tyler Sun on 3/10/23.
//

import SwiftUI


struct MovieListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var movies: FetchedResults<Movies>

    @State private var isEditing: Bool = false


    var startPoint = UnitPoint.topLeading
    var endPoint = UnitPoint.bottomTrailing
    
    
    
    
    var body: some View {
        List() {
            ForEach(movies, id: \.id) { movie in
                NavigationLink {
                    if isEditing == true {
                        AddMovieView(movie: movie)
                    } else {
                        MovieDetailView(movie: movie)
                    }
                    
                     }
                    label: {
                    VStack {
                        Text(movie.title ?? "movie title")
                            .font(.title)
                        
                        Text("\(movie.releaseDate?.formatted(.dateTime.day().year().month()) ?? Date.distantPast.formatted())")
                    }
                }
            }.onDelete(perform: deleteMovies)
            VStack {
                Text("movie count \(movies.count)")
            }
        }
        
        .toolbar {
            Button(isEditing ? "Done" : "Edit" ) {
                isEditing.toggle()
            }
        }
        .background {
            LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: startPoint, endPoint: endPoint)
        }
        .scrollContentBackground(.hidden)
        .toolbar {
            NavigationLink(destination: AddMovieView(), label: { Text("ADD")})
        }
        .navigationTitle("Movie List")
        .background(LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: startPoint, endPoint: endPoint))
        
    }
    
    func deleteMovies(at offsets: IndexSet) {
        for offset in offsets {
            let movie = movies[offset]
            moc.delete(movie)
        }
        
        try? moc.save()
    }
}
    


struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
