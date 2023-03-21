//
//  HomeInteractor.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/20/23.
//

import Foundation

final class HomeInteractor: HomeInteractorProtocol {
    
    weak var delegate: HomeInteractorDelegate?
    private let service: PokemonServiceInterface
    private let pokemonsCount: Int = 20
    private var combinedArray: [CombinedArray] = []
    
    init(service: PokemonServiceInterface = PokemonService(service: CoreService())) {
        self.service = service
    }
    
    func load() {
      fetchPokemons()
    }
    func fetchPokemons() {
        service.fetchPokemons(endPoint: .getPokemons(count: pokemonsCount)) { [weak self] results in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch results {
                case .success(let pokemons):
                    let pokemonNames = pokemons.results.map { $0.name }
                    let dispatchGroup = DispatchGroup()
                    for pokemonName in pokemonNames {
                        dispatchGroup.enter()
                        self.service.fetchPokemonsDetail(endPoint: .getPokemonByName(name: pokemonName)) { [weak self] result in
                            guard let self = self else { return }
                            switch result {
                            case .success(let pokemonsDetail):
                                let abilities = pokemonsDetail.abilities.map { $0.ability.name }
                                let combinedArray = CombinedArray(name: pokemonName, image: pokemonsDetail.sprites.frontDefault, abilities: abilities)
                                self.combinedArray.append(combinedArray)
                                dispatchGroup.leave()
                            case .failure(let error):
                                print("Error fetching detail \(error.localizedDescription)")
                                dispatchGroup.leave()
                            }
                        }
                    }
                    dispatchGroup.notify(queue: DispatchQueue.main) {
                        self.delegate?.handleOutput(with: .showFeedPokemons(self.combinedArray))
                        }
                case .failure(let error):
                    print("Error fetching \(error.localizedDescription)")
                }
            }
        }
    }
}

