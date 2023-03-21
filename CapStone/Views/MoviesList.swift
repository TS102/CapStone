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

    
    var startPoint = UnitPoint.topLeading
    var endPoint = UnitPoint.bottomTrailing
    
    
    
    var body: some View {
        List() {
            ForEach(movieModel, id: \.id) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie), label: {
                    VStack {
                        Text(movie.title ?? "movie title")
                            .font(.title)
                        
                        if let date = movie.releaseDateStr {
                            Text("\(date)")
                        } else {
                            Text("Release Date")
                        }
                    }
                })
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
            NavigationLink(destination: AddMovieView(), label: { Text("ADD")})
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
