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
        TabView {
            NavigationView {
                MovieListView()
            }
            .tabItem {
            Label("Movie list", systemImage: "film")
            }
        MoviesToWatch()
            .tabItem {
                Label("Movies To watch", systemImage: "film")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
