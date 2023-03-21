//
//  HomeContracts.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/20/23.
//

import Foundation

//MARK: - Interactor
protocol HomeInteractorProtocol: AnyObject {
    var delegate: HomeInteractorDelegate? { get set }
    func load()
    func fetchPokemons()
}
enum HomeInteractorOutput {
    case showFeedPokemons([CombinedArray])
}
protocol HomeInteractorDelegate: AnyObject {
    func handleOutput(with output: HomeInteractorOutput)
}
//MARK: - Prenter
protocol HomePresenterProtocol: AnyObject {
    func load()
}
enum HomePresenterOutput {
    case showFeedPokemons([CombinedArray])
}
//MARK: - View
protocol HomeViewProtocol: AnyObject {
    func handleOutput(with output: HomePresenterOutput)
}
//MARK: - Route
enum HomeRoute {
    case detail
}
protocol HomeRouteProtocol: AnyObject {
    func navigate(to route: HomeRoute)
}
