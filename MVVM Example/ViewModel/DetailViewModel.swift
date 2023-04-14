//
//  DetailViewModel.swift
//  MVVM Example
//
//  Created by Mikail Baykara on 13.04.2023.
//

import Foundation


class DetailViewModel{
 
    var id: Int
    var title: String
    var imageUrl: URL?
    var overview: String
    
    init(movie: Movie) {
        
        self.id = movie.id
        self.title = movie.name ?? movie.title ?? ""
        self.overview = movie.overview ?? ""
        self.imageUrl = makeImageUrl(movie.posterPath ?? "")
    }
    
    private func makeImageUrl(_ imageCode: String) -> URL?{
        return URL(string: "\(NetworkConstants.shared.imageServerAddress)\(imageCode)")
    }
}
