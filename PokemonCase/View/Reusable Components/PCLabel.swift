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
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    convenience init(setBackgroundColor: UIColor?, setTextColor: UIColor?, size: CGFloat?, setAlignment: NSTextAlignment?) {
        self.init(frame: .zero)
        backgroundColor = setBackgroundColor
        textColor = setTextColor
        font = .systemFont(ofSize: size!, weight: .bold)
        textAlignment = setAlignment!
    }
    private func configure() {
        numberOfLines = 0
    }
}
