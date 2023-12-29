//
//  PresentableError.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import Foundation

protocol PresentableError where Self: Error {
    var userMessage: String { get }
    var isNetworkError: Bool { get }
}

extension APIError {
    var isNetworkError: Bool {
        switch self {
        case .noNetwork:    return true
        default:            return false
        }
    }
}
