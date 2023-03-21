//
//  HomeDetailBuilder.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/21/23.
//

import Foundation

final class HomeDetailBuilder {
    static func make(with pokemon: CombinedArray) -> HomeDetailView {
        let vc = HomeDetailView()
        let interactor = HomeDetailInteractor()
        let presenter = HomeDetailPresenter(view: vc, interactor: interactor, combinedArray: pokemon)
        interactor.delegate = presenter
        vc.presenter = presenter
        return vc
    }
}
