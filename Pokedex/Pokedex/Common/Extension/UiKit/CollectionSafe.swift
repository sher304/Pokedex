//
//  CollectionSafe.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 30/12/23.
//

import Foundation

public extension Collection {
    subscript (safe index: Index) -> Iterator.Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
}
