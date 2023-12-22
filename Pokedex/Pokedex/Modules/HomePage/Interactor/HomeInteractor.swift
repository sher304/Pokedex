//
//  HomeInteractor.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import Foundation

protocol HomeInteractorInput {
    func getPokemon(name: String)
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
    func getPokemon(name: String) {
        PokemonService.getPokemon(name: name) { [weak self] result in
            switch result {
            case .success(let model):
                guard let data = model else { return }
                self?.presenter?.getPokemon(pokemon: data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
