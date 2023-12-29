//
//  ParsableError.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import Foundation

public struct ParsableError: Decodable, PresentableError {
    // MARK: - Properties
    private let message: String
    let type: String
    let errors: [DetailError]?

    // MARK: - Nested struct
    struct DetailError: Decodable {
        let name: String
        let message: String
    }

    // MARK: - PresentableError
    var userMessage: String {
        return message
    }

    var isNetworkError: Bool {
        return false
    }
}
