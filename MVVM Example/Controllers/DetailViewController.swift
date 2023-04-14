//
//  DetailViewController.swift
//  MVVM Example
//
//  Created by Mikail Baykara on 13.04.2023.
//

import UIKit
import SDWebImage


class DetailViewController: UIViewController{
    
//     IBOutlets
    @IBOutlet var movieOverview: UITextView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieImage: UIImageView!
    
    
    var movie: Movie? = nil
    var viewModel: DetailViewModel? = nil
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = DetailViewModel(movie: movie!)
        
        setUpView()
    }
    

    func setUpView(){
        guard let viewModel else { return }
        self.movieTitle.text = viewModel.title
        self.movieOverview.text = viewModel.overview
        self.movieImage.sd_setImage(with: viewModel.imageUrl)
        
        self.movieImage.layer.cornerRadius = 15
        
    }
    

}
