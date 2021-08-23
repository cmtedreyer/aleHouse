//
//  UIFontExtension.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import UIKit

public extension UIFont {
    static func regular(size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }
    
    static func bold(size: CGFloat = UIFont.systemFontSize) -> UIFont {
        UIFont.boldSystemFont(ofSize: size)
    }
}
