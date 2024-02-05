//
//  HomeInteractor.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import Foundation

protocol HomeInteractorInput {
    func getPokemons(page: String?)
}

final class HomeInteractor {
    
    var presenter: HomeInteractorOutput?
    var PokemonService: PokemonService
    
    init(PokemonService: PokemonService) {
        self.PokemonService = PokemonService
    }
    
}


// MARK: HomeInteractorInput
extension HomeInteractor: HomeInteractorInput {
    func getPokemons(page: String?) {
        PokemonService.getPokemons(page: page) { [weak self] result in
            switch result {
            case .success(let model):
                guard let data = model else { return }
                self?.presenter?.getPokemons(pokemons: data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
