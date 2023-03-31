//
//  PokemonService.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/20/23.
//

import Foundation

protocol PokemonServiceInterface: AnyObject {
    func fetchPokemons(endPoint: PokemonEndpoint, completion: @escaping (Result<PokemonModel,NetworkError>) -> Void)
    func fetchPokemonsDetail(endPoint: PokemonEndpoint, completion: @escaping (Result<PokemonAbilityModel,NetworkError>) -> Void)
}

final class PokemonService: PokemonServiceInterface {
    
    private let coreService: CoreServiceProtokol
    
    init(service: CoreServiceProtokol) {
        self.coreService = service
    }
    
    func fetchPokemons(endPoint: PokemonEndpoint, completion: @escaping (Result<PokemonModel, NetworkError>) -> Void) {
        coreService.makeRequest(endPoint: endPoint) { (result: Result<PokemonModel, NetworkError>) in
            completion(result)
        }
    }
    func fetchPokemonsDetail(endPoint: PokemonEndpoint, completion: @escaping (Result<PokemonAbilityModel, NetworkError>) -> Void) {
        coreService.makeRequest(endPoint: endPoint) { (result: Result<PokemonAbilityModel, NetworkError>) in
            completion(result)
        }
    }
}
