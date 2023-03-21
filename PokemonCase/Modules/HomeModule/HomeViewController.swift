//
//  HomeViewController.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/20/23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol!
    
    private var collection: UICollectionView!
    private var pokemonsModel: [CombinedArray] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
        setNavBarTitle()
        setCollectionDefaultLayout()
        setSubviews()
        setLayout()
        setRegisterCollection()
        setOwner()
    }
    private func setUI() {
        view.backgroundColor = .systemBackground
    }
    private func setNavBarTitle() {
        title = "Pokémon World"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    private func setRegisterCollection() {
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: ReusableIdentifier.homeIdentifier)
    }
    private func setLayout() {
        collection.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: view.frame.width, height: view.frame.height))
    }
    private func setSubviews() {
        [collection].forEach { elements in
            view.addSubview(elements)
        }
    }
    private func setOwner() {
        collection.delegate = self
        collection.dataSource = self
    }
    private func setCollectionDefaultLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
    }
}
//MARK: - UICollectionViewDataSource Methods
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pokemonsModel.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReusableIdentifier.homeIdentifier, for: indexPath) as? HomeCollectionViewCell else { return  UICollectionViewCell() }
        let model = pokemonsModel[indexPath.item]
        cell.setPokemonImage(model: model)
        cell.setPokemonText(model: model)
        return cell
    }
}
//MARK: - UICollectionViewDelegate Methods
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        presenter.selectPokemon(at: indexPath.item)
    }
}
//MARK: - UICollectionViewDelegateFlowLayout Methods
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (view.frame.width)
        return .init(width: width - 40, height: 170)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 30, bottom: 0, right: 30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .init(20)
    }
}
//MARK: - HomeViewProtocol Handling Outputs
extension HomeViewController: HomeViewProtocol {
    func handleOutput(with output: HomePresenterOutput) {
        switch output {
        case .showFeedPokemons(let combinedArray):
            self.pokemonsModel = combinedArray
            self.collection.reloadData()
        }
    }
}

