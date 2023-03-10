//
//  ContentView.swift
//  CapStone
//
//  Created by Tyler Sun on 3/10/23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var movies: [Movie] = MoviesWatch.moviesWatched
    
    var body: some View {
        NavigationView {
            List(movies, id: \.id) { movie in
                VStack {
                    Text(movie.title)
                        .font(.largeTitle)
                        .fontWeight(.ultraLight)
                        
                    
                    Text(movie.releaseDate)
                        .lineLimit(1)
                        .fixedSize()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }.navigationTitle("Movie List")
            Text("Select an item")
        }
    }

    private func addItem() {
  
    }

    private func deleteItems(offsets: IndexSet) {

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
