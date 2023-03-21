//
//  HomeDetailView.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/21/23.
//

import UIKit
import SDWebImage

final class HomeDetailView: UIViewController {
    
    private let pokemonImage = PCImage(radius: 10)
    private let pokemonsName = PCLabel(setBackgroundColor: .clear, setTextColor: .black, size: 30, setAlignment: .center)
    private let pokemonAbilities = PCLabel(setBackgroundColor: .clear, setTextColor: .darkGray, size: 30, setAlignment: .center)
    
    var presenter: HomeDetailPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
        setUI()
        setSubviews()
        setLayout()
    }
    private func setUI() {
        view.backgroundColor = .systemBackground
    }
    private func setSubviews() {
        [pokemonsName, pokemonImage, pokemonAbilities].forEach { elements in
            view.addSubview(elements)
        }
    }
    private func setLayout() {
        pokemonImage.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10), size: .init(width: 150, height: 150))
        pokemonImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250).isActive = true
        pokemonImage.contentMode = .scaleAspectFit
        
        pokemonsName.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: .init(width: 100, height: 50))
        pokemonsName.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
        
        pokemonAbilities.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 0, right: 5), size: .init(width: 100, height: 80))
        pokemonAbilities.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        
    }
}
//MARK: - HomeDetailView Handling Outputs
extension HomeDetailView: HomeDetailViewProtocol {
    func updateView(with model: CombinedArray) {
        if let imageURL = model.image {
            pokemonImage.sd_imageIndicator = SDWebImageActivityIndicator.medium
            pokemonImage.sd_imageTransition = .fade
            pokemonImage.sd_setImage(with: URL(string: imageURL))
        }
        pokemonsName.text = model.name.capitalized
        pokemonAbilities.text = "Skills: \(model.abilities.joined(separator: ", ").capitalized)"
    }
    func handleOutput(with output: HomeDetailPresenterOutput) {
            
    }
}
