//
//  AddMovieView.swift
//  CapStone
//
//  Created by Tyler Sun on 3/13/23.
//

import SwiftUI


struct AddMovieView: View {
    @State private var movieTitle: String = ""
    @State private var releaseDate: String = ""
    @State private var genre: String = ""
    @State private var description: String = ""
    @State private var myReview: String = ""
    

    

    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white, .pink]), startPoint: .topTrailing, endPoint: .bottomLeading)
            Form {
                VStack(alignment: .leading) {
                    Section {
                        Text("Movie:")
                        TextField("", text: $movieTitle).border(.black)
                        
                        Text("ReleaseDate")
                        TextField("", text: $releaseDate).border(.black)
                        
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
