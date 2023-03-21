//
//  PCLabel.swift
//  PokemonCase
//
//  Created by Kaan Yeyrek on 3/21/23.
//

import UIKit

class PCLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    convenience init(setBackgroundColor: UIColor?, setTextColor: UIColor?, size: CGFloat?, setAlignment: NSTextAlignment?) {
        self.init(frame: .zero)
        backgroundColor = setBackgroundColor
        textColor = setTextColor
        font = .systemFont(ofSize: size!, weight: .bold)
        textAlignment = setAlignment!
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        numberOfLines = 0
    }
}
