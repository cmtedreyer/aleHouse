//
//  BaseSearchBar.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import UIKit

final class BaseSearchBar: UISearchBar {
    convenience init(placeHolder: String) {
        self.init()
        self.placeholder = placeholder
        self.sizeToFit()
        self.isTranslucent = false
        self.backgroundImage = UIImage()
    }
}
