//
//  NetworkService.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import Foundation

typealias EmptyCompletion = (NetworkResult<EmptyResponce>) -> Void

public enum NetworkResult<Model> {
    case success(Model)
    case failure(APIError)
    
    // Returns true, if responce success, otherwise false
    
    public var isSuccess: Bool {
        switch self {
        case .success: return true
        case .failure: return false
        }
    }
    
    public var isFailure: Bool  {
        return !isSuccess
    }
    
    public var value: Model? {
        switch self {
        case .success(let value): return value
        case .failure: return nil
        }
    }
    
    public var error: APIError? {
        switch self {
        case .success:              return nil
        case .failure(let error):   return error
        }
    }
}

// MARK: - Equatable
extension NetworkResult: Equatable where Model: Equatable {
    public static func == (lhs: NetworkResult, rhs: NetworkResult) -> Bool {
        switch (lhs, rhs) {
        case (.success(let lhs), .success(let rhs)):
            return lhs == rhs
        case (.failure(let lhs), .failure(let rhs)):
            return lhs == rhs
        default:
            return false
        }
    }
}
