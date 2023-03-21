//
//  PokemonAbilityModel.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/20/23.
//

import Foundation

struct PokemonAbilityModel: Decodable {
    let abilities: [AbilityItem]
    let sprites: PokemonImage
}
struct AbilityItem: Decodable {
    let ability: Ability
}
struct Ability: Decodable {
    let name: String
    let url: String
}
struct PokemonImage: Decodable {
    let frontDefault: String?
    
enum CodingKeys: String, CodingKey {
    case frontDefault = "front_default"
    }
}
