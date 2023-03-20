//
//  ContentView.swift
//  CapStone
//
//  Created by Tyler Sun on 3/10/23.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var movies: FetchedResults<Movies>
    
    var body: some View {

        NavigationView {
            MovieListView()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
