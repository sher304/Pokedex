//
//  NSObject+ClassName.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 30/12/23.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return String(describing: type(of: self))
    }
}
