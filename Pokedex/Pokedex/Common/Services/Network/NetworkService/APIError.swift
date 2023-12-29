//
//  APIError.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import Foundation

public enum APIError: Error, LocalizedError {
    case noBaseUrl
    case noNetwork
    case serverError(error: Error?, response: HTTPURLResponse?, data: Data?)
    case parsableError(ParsableError)
    case notAuthorized
    case decodingError
    case custom(_ error: String?)

    // MARK: - LocalizedError
    var statusCode: Int? {
        switch self {
        case .serverError(_, let response, _):
            return response?.statusCode
        default:
            return nil
        }
    }

    var localizedDescription: String {
        switch self {
        case .noBaseUrl:
            return "No base URL provided."
        case .noNetwork:
            return "No network connection."
        case .serverError(let error, let response, _):
            var resultString = "Server error."
            if let response = response {
                resultString += " Status code: \(response.statusCode)"
            }
            if let error = error {
                resultString += " Error description: \(error.localizedDescription)"
            }
            return resultString
        case .parsableError(let error):
            return error.userMessage
        case .notAuthorized:
            return "User should be authorized."
        case .decodingError:
            return "Error decoding object."
        case .custom(let error):
            guard let err = error else {
                return "Custom error. Additional info not provided."
            }
            return "Custom error. Additional info: \(err)"
        }
    }
}

// MARK: - PresentableError
extension APIError: PresentableError {
    var userMessage: String {
        switch self {
        case .noBaseUrl:
            return "Ошибка запроса"
        case .noNetwork:
            return "Отсутствует интернет соединение"
        case .serverError, .decodingError:
            return "Не удалось получить данные"
        case .parsableError(let error):
            return error.userMessage
        case .notAuthorized:
            return "Для корректной работы раздела необходима авторизация"
        case .custom(let message):
            return message ?? "Непредвиденная ошибка!"
        }
    }
}

// MARK: - Equatable
extension APIError: Equatable {
    public static func == (lhs: APIError, rhs: APIError) -> Bool {
        switch (lhs, rhs) {
        case (.noBaseUrl, .noBaseUrl):
            return true
        case (.noNetwork, .noNetwork):
            return true
        case (.notAuthorized, .notAuthorized):
            return true
        case (.decodingError, .decodingError):
            return true
        case (.custom(let lhs), .custom(let rhs)):
            return lhs == rhs
        case (.serverError(_, let lhsResp, let lhsData), .serverError(_, let rhsResp, let rhsData)):
            return lhsResp?.statusCode == rhsResp?.statusCode && lhsData == rhsData
        default:
            return false
        }
    }
}
