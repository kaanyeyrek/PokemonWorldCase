//
//  HomeBuilder.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/20/23.
//

import Foundation

final class HomeBuilder {
    
    static func make() -> HomeViewController {
        let vc = HomeViewController()
        let router = HomeRouter(view: vc)
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: vc, interactor: interactor, router: router)
        interactor.delegate = presenter
        vc.presenter = presenter
        return vc 
    }
}
