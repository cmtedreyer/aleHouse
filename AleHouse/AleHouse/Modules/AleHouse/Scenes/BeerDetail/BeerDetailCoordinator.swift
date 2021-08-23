//
//  BeerDetailCoordinator.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 23/08/21.
//

import UIKit

final class BeerDetailCoordinator {
    private let navigationController: UINavigationController
    private let beer: Beer
    
    init(navigationController: UINavigationController,
         beer: Beer) {
        self.navigationController = navigationController
        self.beer = beer
    }
    
    func start() -> UIViewController {
        let presenter = BeerDetailPResenter()
        let interactor = BeerDetailInteractor(presenter: presenter,
                                              beer: beer)
        let viewController = BeerDetailViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}
