//
//  HomePresenter.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import Foundation

protocol HomeViewOutput: ViewOutput {
    func postScrollEnded()
}

protocol HomeInteractorOutput {
    func getPokemons(pokemons: PokemonsGroup)
}

final class HomePresenter {
    
    weak var view: HomeViewInput?
    var router: HomeRouterInput?
    var interactor: HomeInteractorInput?
    private var page: Int = 0
    private var pokemonsGroup: [Species] = []
    
    private var dataProvider: HomeDataProviderInput
    
    // MARK: Init
    init(dataProvider: HomeDataProvider) {
        self.dataProvider = dataProvider
    }
}


// MARK: HomeViewOutput {
extension HomePresenter: HomeViewOutput {
    func viewDidLoad() {
        interactor?.getPokemons(page: self.page.description)
    }
    
    func postScrollEnded() {
        page += 20
        interactor?.getPokemons(page: page.description)
    }
}


// MARK: HomeInteractorOutput {
extension HomePresenter: HomeInteractorOutput {
    func getPokemons(pokemons: PokemonsGroup) {
        self.pokemonsGroup.append(contentsOf: pokemons.results)
        let viewModel = dataProvider.createViewModel(pokemons: self.pokemonsGroup)
        view?.updateViewModel(viewModel: viewModel)
    }
}
