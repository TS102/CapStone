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
                            AddMovieView(movie: movie, isEditing: $isEditing)
                        } else {
                            MovieDetailView(movie: movie)
                        }
                    }
                label: {
                    VStack(spacing: 20) {
                        Text(movie.title ?? "movie title")
                            .font(.title)
                        HStack(spacing: 50) {
                            
                            Text("\(movie.releaseDate?.formatted(.dateTime.day().year().month()) ?? Date.distantPast.formatted())")
                            
                            
                            Text("Rating: \(movie.rating.formatted())%")
                            switch movie.rating {
                            case 50...70:
                                Image("Spilledpopcorn").resizable().scaledToFit().aspectRatio(contentMode: .fit)
                            case 71...90:
                                Image("Popcorn").resizable().scaledToFit().aspectRatio(contentMode: .fit)
                            case 91...100:
                                Image("Oscar").resizable().scaledToFit().aspectRatio(contentMode: .fit)
                            default:
                                Image("Rotten").resizable().scaledToFit().aspectRatio(contentMode: .fit)
                            }
                         
                            
                        }
                    }
                }
                }.onDelete(perform: deleteMovies)
                VStack {
                    Text("movie count \(movies.count)")
                }
            }
            .toolbar {
                NavigationLink(destination: AddMovieView( isEditing: $isEditing), label: { Text("Add")}).disabled(isEditing)
                
                Button(isEditing ? "Done" : "Edit" ) {
                    isEditing.toggle()
                }
            }
            .background {
                LinearGradient(gradient: Gradient(colors: [.clear, .white, .gray]), startPoint: startPoint, endPoint: endPoint)
            }
            
            .scrollContentBackground(.hidden)
            .navigationTitle("Movie List")
            .background(LinearGradient(gradient: Gradient(colors: [.gray, .clear, .white, .gray]), startPoint: startPoint, endPoint: endPoint))
        
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
