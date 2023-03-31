//
//  HomeDetailContracts.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/21/23.
//

import Foundation

//MARK: - Interactor
protocol HomeDetailInteractorProtocol: AnyObject {
    var delegate: HomeDetailInteractorDelegate? { get set }
    func load()
}
enum HomeDetailInteractorOutput {
    
}
protocol HomeDetailInteractorDelegate: AnyObject {
    func handleOutput(with output: HomeDetailInteractorOutput)
}
//MARK: - Presenter
protocol HomeDetailPresenterProtocol: AnyObject {
    func load()
}
enum HomeDetailPresenterOutput {

}
//MARK: - View
protocol HomeDetailViewProtocol: AnyObject {
    func handleOutput(with output: HomeDetailPresenterOutput)
    func updateView(with model: CombinedArray)
}


