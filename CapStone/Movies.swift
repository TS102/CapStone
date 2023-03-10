//
//  Movies.swift
//  CapStone
//
//  Created by Tyler Sun on 3/10/23.
//

import Foundation
import UIKit


struct Movie: Identifiable {
    let id = UUID()
    var title: String
    var releaseDate: String
    var genre: String
    var description: String
    var myReview: String
    
}

struct MoviesWatch {
    static let moviesWatched = [
        Movie(title: "Creed 3", releaseDate: "03/4/2023", genre: "Action", description: "The movie is about Creed having to fight the shadows of his past through an old friend.", myReview: "I really like how the movie branches out from the Rocky movies. The cinemtography for the fights were so good, something new and it was refreshing.")
    ]
}
