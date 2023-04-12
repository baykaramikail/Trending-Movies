//
//  MovieCollectionViewCellViewModel.swift
//  MVVM Example
//
//  Created by Mikail Baykara on 12.04.2023.
//

import Foundation

class MovieCollectionViewCellViewModel{
    
    var id: Int
    var title: String
    var releaseDate: String
    var rating: String
    var imageUrl: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.releaseDate = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.rating = "\(movie.voteAverage)/10"
        self.imageUrl = makeImageUrl(movie.posterPath ?? "")
    }
    
    private func makeImageUrl(_ imageCode: String) -> URL?{
        return URL(string: "\(NetworkConstants.shared.imageServerAddress)\(imageCode)")
    }
}
