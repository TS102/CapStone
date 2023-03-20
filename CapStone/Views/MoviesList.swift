//
//  MoviesList.swift
//  CapStone
//
//  Created by Tyler Sun on 3/10/23.
//

import SwiftUI


struct MovieListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var movieModel: FetchedResults<Movies>
    @State var movies: [Movie] = MoviesWatch.moviesWatched
    
    var startPoint = UnitPoint.topLeading
    var endPoint = UnitPoint.bottomTrailing
    
    
    
    var body: some View {
        List() {
            ForEach(movieModel, id: \.id) { movie in
                VStack {
                    Text(movie.title ?? "movie title")
                        .font(.title)
 
                }
            }
            VStack {
                Text("movie count \(movieModel.count)")
            }
        }
        
        //                .padding()
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
    
    
//    func delete(at offsets: IndexSet) {
//        moviemode.remove(atOffsets: offsets)
//    }
    


struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
