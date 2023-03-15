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
    var releaseDate: Date
    var genre: String
    var description: String
    var myReview: String
}

func date(year: Int, day: Int, month: Int) -> Date{
    var components = DateComponents()
    components.year = year
    components.day = day
    components.month = month
    
    let date = Calendar.current.date(from: components) ?? Date.distantPast
    
    return date
}

struct MoviesWatch {
    
    static let moviesWatched = [
        Movie(title: "Creed 3", releaseDate: date(year: 2023, day: 3, month: 3), genre: "Action", description: "The movie is about Creed having to fight the shadows of his past through an old friend.", myReview: "I really like how the movie branches out from the Rocky movies. The cinemtography for the fights were so good, something new and it was refreshing."),
        Movie(title: "Star Wars A New Hope", releaseDate: date(year: 1978, day: 21, month: 7), genre: "Sci-Fi", description: "lasjf", myReview: "lsjfalksjfjaipwejgpwiaogiqjw;ogjaqe")
    ]
}
