//
//  MoviesList.swift
//  CapStone
//
//  Created by Tyler Sun on 3/10/23.
//

import SwiftUI


struct MovieListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title)
    ])
    var movies: FetchedResults<Movies>

    @State private var isEditing: Bool = false


    var startPoint = UnitPoint.topLeading
    var endPoint = UnitPoint.bottomTrailing
    
    var width: Double = 120
    var hegith: Double = 120
    
    var body: some View {
            List() {
                ForEach(movies, id: \.id) { movie in
                    NavigationLink {
                        if isEditing == true {
                            AddMovieView(movie: movie, isEditing: $isEditing)
                                .transition(.slide)
                        } else {
                            MovieDetailView(movie: movie)
                                .transition(.scale)
                        }
                    }
                label: {
                    VStack(spacing: 20) {
                        Text(movie.title ?? "movie title")
                            .font(.title)
                        HStack(spacing: 40) {
                            
                            Text("\(movie.releaseDate?.formatted(.dateTime.year().month()) ?? Date.distantPast.formatted())")
                            
                            Text("Rating: \(movie.rating.formatted())%")
                            switch movie.rating {
                            case 50...70:
                                Image("SpilledPopcorn").resizable().scaledToFit().aspectRatio(contentMode: .fit)
                                    .frame(width: width, height: hegith)
                            case 71...90:
                                Image("Popcorn").resizable().scaledToFit().aspectRatio(contentMode: .fit) .frame(width: width, height: hegith)
                            case 91...100:
                                Image("Oscar").resizable().scaledToFit().aspectRatio(contentMode: .fit) .frame(width: width, height: hegith)
                            default:
                                Image("Rotten").resizable().scaledToFit().aspectRatio(contentMode: .fit) .frame(width: width, height: hegith)
                            }
                        }
                    }
                }
                }.onDelete(perform: deleteMovies)
            }.toolbar {
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddMovieView(isEditing: $isEditing)) {
                        Text("Add")
                    }
                    .transition(.opacity)
                    .disabled(isEditing)
                    
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(isEditing ? "Done" : "Edit") {
                        isEditing.toggle()
                    }
                }
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    NavigationLink(destination: Settings()) {
                        Image(systemName: "gear")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Spacer()
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
