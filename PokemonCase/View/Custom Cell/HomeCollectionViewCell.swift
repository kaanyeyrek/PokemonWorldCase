//
//  HomeCollectionViewCell.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/21/23.
//

import UIKit
import SDWebImage

class HomeCollectionViewCell: UICollectionViewCell {
    
    private let pokemonsImage = PCImage(radius: nil)
    private let pokemonsName = PCLabel(setBackgroundColor: .clear, setTextColor: .black, size: 20, setAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonsImage.image = nil
        pokemonsName.text = ""
    }
    private func setSubviews() {
        [pokemonsImage, pokemonsName].forEach { elements in
            self.addSubview(elements)
        }
    }
    // Layout
    private func setLayout() {
        pokemonsImage.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: nil, padding: .init(top: 5, left: 5, bottom: 5, right: 0), size: .init(width: 150, height: 150))
        pokemonsName.anchor(top: self.topAnchor, leading: nil, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 40), size: .init(width: 120, height: 50))
    }
    func setPokemon(model: CombinedArray) {
        pokemonsName.text = model.name.capitalized
        pokemonsImage.setImage(model.image)
    }
}
//MARK: - UIImageView Extension
extension UIImageView {
    func setImage(_ urlString: String?) {
        guard let urlString = urlString else { return }
        self.sd_imageIndicator = SDWebImageActivityIndicator.medium
        self.sd_imageTransition = .fade
        self.sd_setImage(with: URL(string: urlString))
    }
}
