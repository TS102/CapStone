//
//  AddMovieView.swift
//  CapStone
//
//  Created by Tyler Sun on 3/13/23.
//

import SwiftUI


struct AddMovieView: View {
    var movie: Movies?
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) private var dismiss
    @Binding var isEditing: Bool
    
    @State private var rating: Double = 0
    let genres = ["Action", "Comedy", "Horror", "Sci-Fi", "Drama", "Mystery", "Romance"]
    @State private var selectedGenre = "Action"
    
    
    @State private var movieTitle: String = ""
    @State private var description: String = ""
    @State private var myReview: String = ""
    @State private var date = Date()
    
    @FocusState var isInputActive: Bool
    
 
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.gray ,.clear, .white, .gray]), startPoint: .topTrailing, endPoint: .bottomLeading)
            Form {
                VStack(alignment: .leading) {
                    Section {
                        Text("Movie:").font(.title3)
                        TextField("", text: $movieTitle).border(.black).focused($isInputActive)

                        
                        Spacer()
                        
                        DatePicker("release Date:", selection: $date, displayedComponents: .date)
                        
                        Picker("Genre", selection: $selectedGenre) {
                            ForEach(genres, id: \.self) {
                                Text($0)
                            }
                        }.pickerStyle(.menu)
                    }
                }
                
                Section {
                    Text("Description:").font(.title3)
                    TextField("", text: $description, axis: .vertical).border(.black).focused($isInputActive)
                    
                    Text("MyReview:").font(.title3)
                    TextField("", text: $myReview, axis: .vertical).border(.black).focused($isInputActive)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                        Button("Done") {
                            isInputActive = false
                                }
                            }
                        }
                }
                
                Section {
                    Text("How would you rate it?").font(.title3)
                    VStack {
                        Slider(value: $rating, in: 0...100, step: 1)
                        Text("\(rating.formatted())%")
                    }
                }
                
                Button(isEditing ? "Edit Movie" : "Add Movie") {
                    
                    if !movieTitle.isEmpty && !description.isEmpty && !myReview.isEmpty {
                        if let movie {
                            DataController().editMovie(movie: movie, title: movieTitle, genre: selectedGenre, releaseDate: date, description: description, myReview: myReview, rating: rating, context: moc)
                            isEditing.toggle()
                            print("movie has been edited")
                        } else {
                            let newMovie = Movies(context: moc)
                            newMovie.id = UUID()
                            newMovie.title = movieTitle
                            newMovie.releaseDate = date
                            newMovie.genre = selectedGenre
                            newMovie.movieDescription = description
                            newMovie.myReview = myReview
                            newMovie.rating = rating
                            try? moc.save()
                            print("movie has been added")
                        }
                    }
                    withAnimation(Animation.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 0)) {
                        dismiss()
                    }
                }
                .foregroundColor(Color.blue)
                .font(.title)
                .frame(maxWidth: .infinity)
            }
            .background( LinearGradient(gradient: Gradient(colors: [.gray, .clear, .white, .gray]), startPoint: .topTrailing, endPoint: .bottomLeading))
            .scrollContentBackground(.hidden)
            .onAppear{ isMovieSent(EditMode: isEditing) }

        }
    }
}


struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddMovieView(isEditing: .constant(false))
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
                rating = movie.rating
            }
        }
    }
}




