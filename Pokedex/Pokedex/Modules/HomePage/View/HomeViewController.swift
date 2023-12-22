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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        presenter?.viewDidLoad()
    }
}


// MARK: HomeViewInput
extension HomeViewController: HomeViewInput {
    
}
