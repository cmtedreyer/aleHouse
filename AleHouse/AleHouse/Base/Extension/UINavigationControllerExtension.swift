//
//  UINavigationControllerExtension.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import UIKit

public extension UINavigationController {
    func asyncPushViewController(_ viewController: UIViewController, animated: Bool = true) {
        DispatchQueue.main.async {
            self.pushViewController(viewController, animated: animated)
        }
    }
}
