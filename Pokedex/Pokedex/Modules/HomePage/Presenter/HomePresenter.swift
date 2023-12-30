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
    func getPokemon(pokemon: PokemonsGroup)
}

final class HomePresenter {
    
    weak var view: HomeViewInput?
    var router: HomeRouterInput?
    var interactor: HomeInteractorInput?
    
    private var dataProvider: HomeDataProviderInput
    
    // MARK: Init
    init(dataProvider: HomeDataProvider) {
        self.dataProvider = dataProvider
    }
}


// MARK: HomeViewOutput {
extension HomePresenter: HomeViewOutput {
    func viewDidLoad() {
        interactor?.getPokemon(name: "charmander")
    }
}


// MARK: HomeInteractorOutput {
extension HomePresenter: HomeInteractorOutput {
    func getPokemon(pokemon: PokemonsGroup) {
        let viewModel = dataProvider.createViewModel(pokemons: [pokemon])
        
    }
}
