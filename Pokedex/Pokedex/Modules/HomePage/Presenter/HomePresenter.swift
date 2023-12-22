//
//  HomePresenter.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import Foundation

protocol HomeViewOutput: ViewOutput {
    
}

protocol HomeInteractorOutput {
    func getPokemon(pokemon: Pokemon)
}

final class HomePresenter {
    
    weak var view: HomeViewInput?
    var router: HomeRouterInput?
    var interactor: HomeInteractorInput?
    
}


// MARK: HomeViewOutput {
extension HomePresenter: HomeViewOutput {
    func viewDidLoad() {
        interactor?.getPokemon(name: "charmander")
    }
}


// MARK: HomeInteractorOutput {
extension HomePresenter: HomeInteractorOutput {
    func getPokemon(pokemon: Pokemon) {
        
    }
}
