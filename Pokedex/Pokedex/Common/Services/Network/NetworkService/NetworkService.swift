//
//  NetworkService.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 22/12/23.
//

import Foundation


final class NetworkService<Endpoint: EndpointProtocol> {
    
    func request<Response>(endpoint: Endpoint,
                           completion: @escaping (NetworkResult<Response>) -> Void) where Response: Decodable {
        let url = URLComponents(string: endpoint.baseUrl + endpoint.path)
        guard let resultURL = url?.url else { return }
        var request = URLRequest(url: resultURL)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            let result: NetworkResult<Response>
            
            guard response != nil else {
                result = NetworkResult.failure(APIError.noNetwork)
                return
            }
            
            guard let data = data else {
                return
            }
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            do {
                let object = try JSONDecoder().decode(Response.self, from: data)
                result = NetworkResult.success(object)
            } catch let error {
                NSLog("CheckError \(error)")
                result = NetworkResult.failure(.decodingError)
            }
        }
        .resume()
    }
}
