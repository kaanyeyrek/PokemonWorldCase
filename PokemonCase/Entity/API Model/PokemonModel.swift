//
//  PokemonModel.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/20/23.
//

import Foundation

struct PokemonModel: Decodable {
    let results: [Pokemons]
}
struct Pokemons: Decodable {
    let name: String
    let url: String
}
