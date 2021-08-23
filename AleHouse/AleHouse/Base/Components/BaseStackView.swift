//
//  BaseStackView.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import UIKit

final class BaseStackView: UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis,
                     distribution: UIStackView.Distribution,
                     alignment: UIStackView.Alignment,
                     spacing: CGFloat = 8) {
        self.init()
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }
}

