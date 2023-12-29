//
//  HomeViewController.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import UIKit

protocol HomeViewInput: AnyObject {
    
}

final class HomeViewController: UIViewController {
    // MARK: Properties
    var presenter: HomeViewOutput?
    
    // MARK: Views
    private lazy var collectionView: UICollectionView = {
        let size = CGSize(width: 200, height: 200)
        let layout = CommonCollectionFlowLayout(itemSize: size, lineSpacing: 8, interitemSpacing: 5, scrollDirection: .vertical)
        let collectionV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionV.delegate = self
        collectionV.dataSource = self
        return collectionV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        presenter?.viewDidLoad()
    }
}


// MARK: HomeViewInput
extension HomeViewController: HomeViewInput {
    
}


// MARK: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        return cell
    }
}
