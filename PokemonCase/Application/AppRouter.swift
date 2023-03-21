//
//  AppRouter.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/20/23.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let startVC = HomeBuilder.make()
        let nav = UINavigationController(rootViewController: startVC)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}
