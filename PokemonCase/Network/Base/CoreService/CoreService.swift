//
//  CoreService.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/20/23.
//

import Foundation
import Alamofire

// Reusable Core Request
protocol CoreServiceProtokol: AnyObject {
    func makeRequest<T: Decodable>(endPoint: HTTPEndpoint, completion: @escaping (Result<T, NetworkError>) -> Void)
}
final class CoreService: CoreServiceProtokol {
    func makeRequest<T>(endPoint: HTTPEndpoint, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        var urlComponents = URLComponents()
        urlComponents.scheme = endPoint.scheme
        urlComponents.host = endPoint.host
        urlComponents.path = endPoint.path
        urlComponents.queryItems = endPoint.query
        
        guard let url = urlComponents.url else {
            return completion(.failure(.badURL))
        }
        print(url)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endPoint.method.rawValue
        
        AF.request(urlRequest).validate(statusCode: 200..<300).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let decodedData):
                completion(.success(decodedData))
            case .failure(let error):
                switch error {
                case .responseValidationFailed(let reason):
                    print(reason)
                    completion(.failure(.unexpectedStatusCode))
                default:
                    completion(.failure(.badResponse))
                }
            }
        }
    }    
}
