//
//  HomeViewController.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import UIKit

protocol HomeViewInput: AnyObject {
    func updateViewModel(viewModel: HomeViewModel)
}

final class HomeViewController: UIViewController {
    // MARK: Properties
    var presenter: HomeViewOutput?
    private var viewModel: HomeViewModel?
    
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
    
    // MARK: Draw
    private func setupConstraints() {
        view.addSubview(collectionView)
        
    }
}


// MARK: HomeViewInput
extension HomeViewController: HomeViewInput {
    func updateViewModel(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.collectionView.reloadData()
    }
}


// MARK: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.rows.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let rows = viewModel?.rows[indexPath.row] else {
            assertionFailure("Failuer to configure cell")
            return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rows.rauseId, for: indexPath)
        rows.configurator.configure(cell: cell)
        return cell
    }
}
