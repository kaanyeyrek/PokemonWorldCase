//
//  PCImage.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/21/23.
//

import UIKit

class PCImage: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    convenience init(radius: CGFloat?) {
        self.init(frame: .zero)
        layer.cornerRadius = radius ?? 0
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        clipsToBounds = true
        layer.masksToBounds = true
        contentMode = .scaleAspectFill
    }
}
