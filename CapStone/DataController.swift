//
//  DataController.swift
//  CapStone
//
//  Created by Tyler Sun on 3/20/23.
//
import CoreData
import Foundation


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "MovieModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func editMovie(movie: Movies, title: String, genre: String, releaseDate: Date, description: String, myReview: String) {
        movie.title = title
        movie.genre = genre
        movie.releaseDate = releaseDate
        movie.movieDescription = description
        movie.myReview = myReview
        
    
    }
}
