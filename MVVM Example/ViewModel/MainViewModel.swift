//
//  MainViewModel.swift
//  MVVM Example
//
//  Created by Mikail Baykara on 12.04.2023.
//

import Foundation

class MainViewModel{
    
    var movies: MovieModel?
    var cellDataSource: Observable<[MovieCollectionViewCellViewModel]> = Observable(nil)
    
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int{
        return movies?.results.count ?? 0
    }
    
    func getData(){
        
        NetworkManager.shared.getMovies { [weak self] result in
            
            switch result {
            case .success(let data):
                self?.movies = data
                self?.mapCellData()
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData(){
        self.cellDataSource.value = self.movies?.results.compactMap({ MovieCollectionViewCellViewModel(movie: $0)
        })
    }
    
    func returnMovieWithGivenID(movieId: Int) -> Movie?{
        guard let movie = movies?.results.first(where: { movie in
            movie.id == movieId
        }) else { return nil }
        
        return movie
    }
    
}
