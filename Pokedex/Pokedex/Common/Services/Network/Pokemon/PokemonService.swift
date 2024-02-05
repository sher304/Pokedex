//
//  PokemonService.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import Foundation


protocol PokemonService {
    func getPokemon(name: String, completion: @escaping (NetworkResult<Pokemon?>) -> Void)
    func getPokemons(page: String?, completion: @escaping(NetworkResult<PokemonsGroup?>) -> Void)
}

final class PokemonServiceImpl: PokemonService {
    
    private let networkService: NetworkService<PokemonEndPoint>
    
    init(networkService: NetworkService<PokemonEndPoint>) {
        self.networkService = networkService
    }
    
    func getPokemon(name: String, completion: @escaping (NetworkResult<Pokemon?>) -> Void) {
        let endoint = PokemonEndPoint.getPokemon(name: name)
        networkService.request(endpoint: endoint, completion: completion)
    }
    
    func getPokemons(page: String?, completion: @escaping(NetworkResult<PokemonsGroup?>) -> Void) {
        let enpoint = PokemonEndPoint.getPokemons(page: page)
        networkService.request(endpoint: enpoint, completion: completion)
    }
}
