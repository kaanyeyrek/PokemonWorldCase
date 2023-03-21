//
//  HomeRouter.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/20/23.
//

import UIKit

final class HomeRouter: HomeRouteProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: HomeRoute) {
        switch route {
        case .detail(let pokemonModel):
            let vc = HomeDetailBuilder.make(with: pokemonModel)
            view.show(vc, sender: nil)
        }
    }
}
