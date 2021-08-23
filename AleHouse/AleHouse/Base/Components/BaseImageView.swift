//
//  BaseImageView.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import UIKit

final class BaseImageView: UIImageView {
    convenience init(imageName: String,
                     contentMode: UIView.ContentMode = .scaleAspectFit) {
        self.init()
        self.image = UIImage(named: imageName)
        self.contentMode = contentMode
    }
                     
}
