//
//  HomeViewController.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import UIKit
import SnapKit

protocol HomeViewInput: AnyObject {
    func updateViewModel(viewModel: HomeViewModel)
}

final class HomeViewController: UIViewController {
    // MARK: Properties
    var presenter: HomeViewOutput?
    private var viewModel: HomeViewModel?
    
    // MARK: Views
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let itemSize = CGSize(width: 80, height: 80)
        let layout = CommonCollectionFlowLayout(itemSize: itemSize,
                                                lineSpacing: 10,
                                                interitemSpacing: 5,
                                                scrollDirection: .vertical)
        let collectionV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.register(cellTypes: [PokemonCollectionViewCell.self])
        collectionV.backgroundColor = .white
        return collectionV
    }()

    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        presenter?.viewDidLoad()
        setupConstraints()
    }
    
    
    // MARK: Draw
    private func setupNavbar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchButton)
    }
    
    private func setupConstraints() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
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
        guard let rows = viewModel?.rows[safe: indexPath.row] else {
            assertionFailure("Failuer to configure cell")
            return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rows.rauseId, for: indexPath)
        rows.configurator.configure(cell: cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let viewModel = self.viewModel else { return }
        if indexPath.row == (viewModel.rows.count) - 1 {
            presenter?.postScrollEnded()
        }
    }
}
