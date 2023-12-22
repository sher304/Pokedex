//
//  EndpointProtocol.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import Foundation

public typealias Parameters = [String: Any]
public typealias Method = HTTPMethod
public typealias Headers = [String: String]

protocol EndpointProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var method: Method { get }
    var parameters: Parameters? { get }
    var headers: Headers? { get }

}

extension EndpointProtocol {
    var baseUrl: String {
        return "https://pokeapi.co/api/v2/"
    }

    var parameters: Parameters? {
        return nil
    }

    var headers: Headers? {
        return [:]
    }
}
