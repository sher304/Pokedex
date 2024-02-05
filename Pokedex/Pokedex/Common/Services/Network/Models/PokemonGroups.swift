//
//  PokemonGroups.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 30/12/23.
//

import Foundation

// MARK: - PokemonsGroup
struct PokemonsGroup: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Species]
}
