//
//  HTTPEndpoint.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/20/23.
//

import Foundation

protocol HTTPEndpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var query: [URLQueryItem]? { get }
    var method: HTTPMethods { get }
}
extension HTTPEndpoint {
    var scheme: String { "https" }
    var host: String { "pokeapi.co" }
    var method: HTTPMethods { .get }
}
