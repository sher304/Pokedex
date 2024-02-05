//
//  PokemonEndPoint.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import Foundation


enum PokemonEndPoint: EndpointProtocol {
    
    case getPokemon(name: String)
    case getPokemons(page: String?)
    
    var path: String {
        switch self {
        case .getPokemon(let name):
            return API.getPokemonByName + name
        case .getPokemons(let page):
            return API.getPokemonByName + "?offset=\(page ?? "0")&limit=20"
        }
    }
    
    var method: Method {
        switch self {
        default:
            return .get
        }
    }
}
