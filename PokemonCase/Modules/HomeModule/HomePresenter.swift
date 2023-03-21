//
//  HomePresenter.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/20/23.
//

import Foundation

//MARK: - HomePresenterProtocol
final class HomePresenter: HomePresenterProtocol {
    
    private weak var view: HomeViewProtocol?
    private let interactor: HomeInteractorProtocol
    private let router: HomeRouteProtocol
    
    init(view: HomeViewProtocol, interactor: HomeInteractorProtocol, router: HomeRouteProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func load() {
        interactor.load()
    }
}
//MARK: - HomeInteractorDelegate Handling
extension HomePresenter: HomeInteractorDelegate {
    func handleOutput(with output: HomeInteractorOutput) {
        switch output {
        case .showFeedPokemons(let combinedArray):
            view?.handleOutput(with: .showFeedPokemons(combinedArray))
        }
    }
}
