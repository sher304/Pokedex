//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 30/12/23.
//

import Foundation


struct HomeViewModel {
    
    var rows: [Row]
    
    enum Row {
        case pokemons(configurator: CollectionCellConfiguratorProtocol)
        
        var configurator: CollectionCellConfiguratorProtocol {
            switch self {
            case let .pokemons(configurator):
                return configurator
            }
        }
        
        var rauseId: String {
            return type(of: configurator).reuseId
        }
    }
    
}

