//
//  ContentView.swift
//  CapStone
//
//  Created by Tyler Sun on 3/10/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {

        NavigationView {
            MovieListView()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
