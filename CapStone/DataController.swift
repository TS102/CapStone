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
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("Data could not be saved")
        }
    }
    
    func editMovie(movie: Movies, title: String, genre: String, releaseDate: Date, description: String, myReview: String, rating: Double, context: NSManagedObjectContext) {
        movie.title = title
        movie.genre = genre
        movie.releaseDate = releaseDate
        movie.movieDescription = description
        movie.myReview = myReview
        movie.rating = rating
        
        save(context: context)
    }
}
