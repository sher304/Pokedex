//
//  PokemonEndPoint.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import Foundation


enum PokemonEndPoint: EndpointProtocol {
    
    case getPokemon(name: String)
    
    var path: String {
        switch self {
        case .getPokemon(let name):
            return API.getPokemonByName + name
        }
    }
    
    var method: Method {
        switch self {
        default:
            return .get
        }
    }
}
