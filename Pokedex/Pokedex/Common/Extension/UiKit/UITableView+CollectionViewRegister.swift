//
//  UITableView+CollectionViewRegister.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 30/12/23.
//

import UIKit
//
//extension UICollectionView {
//    func register(cellTypes: [UICollectionViewCell.Type]) {
//        cellTypes.forEach {
//            let reuseIdentifier = $0.className
//            register($0, forCellWithReuseIdentifier: reuseIdentifier)
//        }
//    }
//}
//

extension UICollectionView {
    func register(cellTypes: [UICollectionViewCell.Type]) {

        cellTypes.forEach {
            let reuseIdentifier = $0.className
            register($0, forCellWithReuseIdentifier: reuseIdentifier)
        }
    }
}

extension UITableView {
    func register(cellTypes: [UITableViewCell.Type]) {
        
        cellTypes.forEach {
            let reuseIdentifier = $0.className
            register($0, forCellReuseIdentifier: reuseIdentifier)
        }
    }
}

