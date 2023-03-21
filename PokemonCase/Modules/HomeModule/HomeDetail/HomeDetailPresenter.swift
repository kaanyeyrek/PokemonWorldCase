//
//  HomeDetailPresenter.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/21/23.
//

import Foundation

final class HomeDetailPresenter: HomeDetailPresenterProtocol {
    
    private weak var view: HomeDetailViewProtocol?
    private let interactor: HomeDetailInteractorProtocol
    private let combinedArray: CombinedArray
    
    init(view: HomeDetailViewProtocol, interactor: HomeDetailInteractorProtocol, combinedArray: CombinedArray) {
        self.view = view
        self.interactor = interactor
        self.combinedArray = combinedArray
    }
    
    func load() {
        interactor.load()
        view?.updateView(with: self.combinedArray)
    }
}
//MARK: - HomeDetailInteractorDelegate Outputs
extension HomeDetailPresenter: HomeDetailInteractorDelegate {
    func handleOutput(with output: HomeDetailInteractorOutput) {
        
    }
}
