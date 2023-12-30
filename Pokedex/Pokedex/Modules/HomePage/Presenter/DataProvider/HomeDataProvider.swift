//
//  HomeDataProvider.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 30/12/23.
//

import Foundation

protocol HomeDataProviderInput {
    func createViewModel(pokemons: [PokemonsGroup]) -> HomeViewModel
}


final class HomeDataProvider: HomeDataProviderInput {
    
    
    // MARK: Typealias
    typealias PokemonConfigurator = CollectionCellConfigurator<PokemonCollectionViewCell, PokemonCollectionViewCell.Model>
    
    
    // MARK: Methods
    func createViewModel(pokemons: [PokemonsGroup]) -> HomeViewModel {
        var rows: [HomeViewModel.Row] = []
        
        pokemons.forEach {
            rows.append(
                .pokemons(configurator: PokemonConfigurator(
                    item: PokemonCollectionViewCell.Model(
                                        pokemonImage: $0.name,
                                        pokemonName: $0.name
                    ))))}
        
        return HomeViewModel(rows: rows)
    }
}
