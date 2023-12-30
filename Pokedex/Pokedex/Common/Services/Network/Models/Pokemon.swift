//
//  Pokemon.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 30/12/23.
//

import Foundation

// MARK: - Pokemon
struct Pokemon: Codable {
    let formName: String
    let formNames: [JSONAny]
    let formOrder, id: Int
    let isBattleOnly, isDefault, isMega: Bool
    let name: String
    let names: [JSONAny]
    let order: Int
    let pokemon: PokemonClass
    let sprites: Sprites
    let types: [TypeElement]
    let versionGroup: PokemonClass

    enum CodingKeys: String, CodingKey {
        case formName = "form_name"
        case formNames = "form_names"
        case formOrder = "form_order"
        case id
        case isBattleOnly = "is_battle_only"
        case isDefault = "is_default"
        case isMega = "is_mega"
        case name, names, order, pokemon, sprites, types
        case versionGroup = "version_group"
    }
}

// MARK: - PokemonClass
struct PokemonClass: Codable {
    let name: String
    let url: String
}

// MARK: - Sprites
struct Sprites: Codable {
    let backDefault: String
    let backFemale: JSONNull?
    let backShiny: String
    let backShinyFemale: JSONNull?
    let frontDefault: String
    let frontFemale: JSONNull?
    let frontShiny: String
    let frontShinyFemale: JSONNull?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}
