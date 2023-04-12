//
//  MovieCollectionViewCell.swift
//  MVVM Example
//
//  Created by Mikail Baykara on 12.04.2023.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        get{
            return "MovieCollectionViewCell"
        }
    }
    
    
    @IBOutlet var cellContainerView: UIView!
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieName: UILabel!
    @IBOutlet var movieRating: UILabel!
    @IBOutlet var releaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellContainerView.layer.cornerRadius = 20
        self.cellContainerView.clipsToBounds = true
        self.cellContainerView.layer.borderColor = CGColor(red: 0.6, green: 0.4, blue: 0.5, alpha: 0.5)
        self.cellContainerView.layer.borderWidth = 2
        
        self.movieImage.layer.cornerRadius = 10
        self.movieImage.clipsToBounds = true
    }
    
    func setUpCell(viewModel: MovieCollectionViewCellViewModel){
        self.movieName.text = viewModel.title
        self.movieRating.text = viewModel.rating
        self.releaseDate.text = viewModel.releaseDate
        self.movieImage.sd_setImage(with: viewModel.imageUrl)
    }
    
}
