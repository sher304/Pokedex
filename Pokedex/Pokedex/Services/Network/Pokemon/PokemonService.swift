//
//  PokemonService.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import Foundation


protocol PokemonService {
    func getPokemon(name: String, completion: @escaping (NetworkResult<Pokemon?>) -> Void)
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
}
