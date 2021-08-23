//
//  BaseLabel.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import UIKit

final class BaseLabel: UILabel {
    convenience init(text: String = "",
                            color: UIColor,
                            font: UIFont = UIFont.regular(),
                            numeberOfLines: Int = 0,
                            alignment: NSTextAlignment = .left) {
        self.init()
        self.numberOfLines = numeberOfLines
        self.font = font
        self.textColor = color
        self.text = text
        self.textAlignment = alignment
    }
}
