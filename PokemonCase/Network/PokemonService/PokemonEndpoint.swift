//
//  PokemonEndpoint.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/20/23.
//

import Foundation

enum PokemonEndpoint: HTTPEndpoint {
    
    case getPokemons(count: Int)
    case getPokemonByName(name: String)
    
    var path: String {
        switch self {
        case .getPokemons:
            return Path.pokemons.rawValue
        case .getPokemonByName(let name):
            return "/api/v2/pokemon/\(name)"
        }
    }
    var query: [URLQueryItem]? {
        switch self {
        case .getPokemons(let count):
            return [URLQueryItem(name: "limit", value: String(count))]
        case .getPokemonByName(_):
            return nil
        }
    }
}
