//
//  AddMovieView.swift
//  CapStone
//
//  Created by Tyler Sun on 3/13/23.
//

import SwiftUI


struct AddMovieView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var movieTitle: String = ""
    @State private var releaseDate: String = ""
    @State private var genre: String = ""
    @State private var description: String = ""
    @State private var myReview: String = ""
    @State private var date = Date()
    
 

//    @Binding var movies: [Movie]
    

    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topTrailing, endPoint: .bottomLeading)
            Form {
                VStack(alignment: .leading) {
                    Section {
                        Text("Movie:")
                        TextField("", text: $movieTitle).border(.black)
                        
                        Spacer()
                        DatePicker("release Date", selection: $date, displayedComponents: [.date])
                        
                        Text("Genre:")
                        TextField("", text: $genre).border(.black)
                    }
                }
                Section {
                    Text("Description:")
                    TextField("", text: $description).border(.black)
                    
                    Text("MyReview:")
                    TextField("", text: $myReview).border(.black)
                }
                Button("Add Movie") {
                    
                    let newMovie = Movies(context: moc)
                    newMovie.id = UUID()
                    newMovie.title = movieTitle
//                    newMovie.releaseDateStr = releaseDate
                    newMovie.genre = genre
                    newMovie.movieDescription = description
                    newMovie.myReview = myReview
                    
                    try?(moc.save())
                    print("movie has been added")
                    
//                    movies.append(newMovie)
                    
                    
                                    
                } .foregroundColor(Color.blue)
                    .font(.title)
                    .frame(maxWidth: .infinity)
            }.background( LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topTrailing, endPoint: .bottomLeading))
            .scrollContentBackground(.hidden)
        }
    }
}

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddMovieView()
        }
    }
}
