//
//  AddMovieView.swift
//  CapStone
//
//  Created by Tyler Sun on 3/13/23.
//

import SwiftUI


struct AddMovieView: View {
    var movie: Movies?
    var isEditing = true
    
    let genres = ["Action", "Comedy", "Horror", "Sci-Fi", "Drama", "Mystery", "Romance"]
    @State private var selectedGenre = "Action"
    
    @Environment(\.managedObjectContext) var moc
    
    @State private var movieTitle: String = ""
    @State private var genre: String = ""
    @State private var description: String = ""
    @State private var myReview: String = ""
    @State private var date = Date()
 
    
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
                        
                   
                        Picker("Genre", selection: $selectedGenre) {
                            ForEach(genres, id: \.self) {
                                Text($0)
                            }
                        }.pickerStyle(.menu)
    
                    }
                }
                Section {
                    Text("Description:")
                    TextField("", text: $description).border(.black)
                    
                    Text("MyReview:")
                    TextField("", text: $myReview).border(.black)
                }
                Button("Add Movie") {
                    if !movieTitle.isEmpty && !description.isEmpty && !myReview.isEmpty {
                        let newMovie = Movies(context: moc)
                        newMovie.id = UUID()
                        newMovie.title = movieTitle
                        newMovie.releaseDate = date
                        newMovie.genre = selectedGenre
                        newMovie.movieDescription = description
                        newMovie.myReview = myReview
                        
                            try?(moc.save())
                        
                        print("movie has been added")
                    }
                  
                                    
                                    
                }
                .foregroundColor(Color.blue)
                    .font(.title)
                    .frame(maxWidth: .infinity)
            }
            .onAppear{ isMovieSent(EditMode: isEditing) }
            .background( LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topTrailing, endPoint: .bottomLeading))
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

extension AddMovieView {
    func isMovieSent(EditMode: Bool) {
        if EditMode == true {
            if let movie {
                movieTitle = movie.title ?? "Title"
                description = movie.movieDescription ?? "Description"
                myReview = movie.myReview ?? "Review"
                date = movie.releaseDate ?? Date.distantPast
                selectedGenre = movie.genre ?? "genre"
                
                
                
            }
        }
    }
}



