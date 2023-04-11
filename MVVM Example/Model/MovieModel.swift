//
//  Movies.swift
//  MVVM Example
//
//  Created by Mikail Baykara on 11.04.2023.
//

import Foundation

struct MovieModel: Decodable {
    
    let results: [Movie]
}

// MARK: - Result
struct Movie: Decodable {
    
    let backdropPath: String?
    let id: Int
    let title: String?
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double
    let name: String?
    let firstAirDate: String?
    
}
