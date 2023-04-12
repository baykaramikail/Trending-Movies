//
//  MainViewController.swift
//  MVVM Example
//
//  Created by Mikail Baykara on 25.03.2023.
//

import UIKit

class MainViewController: UIViewController {
    // IBOutlets
    @IBOutlet var MoviesCollectionView: UICollectionView!
    
    // View Model
    let viewModel = MainViewModel()
    
    //Variables
    var cellDataSource: [MovieCollectionViewCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureCollectionView()
        viewModel.getData()
        bindViewModel()
    }
    
    func bindViewModel(){
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else { return }
            
            self.cellDataSource = movies
            self.reloadCollectionView()
        }
    }
    
}



//MARK: - All the Collection View Code

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func reloadCollectionView(){
        DispatchQueue.main.async {
            self.MoviesCollectionView.reloadData()
        }
    }
    
    func configureCollectionView(){
        self.MoviesCollectionView.delegate   = self
        self.MoviesCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: self.view.frame.width - 16, height: 120 )
        }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setUpCell(viewModel: cellViewModel)
        return cell
    }
    
    
}
