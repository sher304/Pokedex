//
//  Configurator.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 23/12/23.
//

import UIKit

protocol Configurable {
    associatedtype Model
    func configure(with model: Model)
}
