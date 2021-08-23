//
//  BaseButton.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import UIKit

final class BaseButton: UIButton {
    convenience init(title: String = "",
                     backgroundColor: UIColor = .systemBlue,
                     fontColor: UIColor = .white,
                     font: UIFont = UIFont.bold(size: 24),
                     cornerRadius: CGFloat = 10) {
        self.init(frame: CGRect.zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.setTitleColor(fontColor, for: .normal)
        self.layer.cornerRadius = cornerRadius
    }
}
