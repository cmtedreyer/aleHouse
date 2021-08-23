//
//  BeerListCoordinator.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import UIKit

protocol BeerListCoordinable {
    func navigateToBeerDetails(_ beer: Beer)
}

final class BeerListCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> UIViewController {
        let service = BeerListService()
        let presenter = BeerListPresenter()
        let interactor = BeerListInteractor(service: service,
                                            presenter: presenter,
                                            coordinator: self)
        let viewController = BeerListViewController(interactor: interactor)
        presenter.viewController = viewController
        return viewController
    }
}

extension BeerListCoordinator: BeerListCoordinable {
    func navigateToBeerDetails(_ beer: Beer) {
        let coordinator = BeerDetailCoordinator(navigationController: navigationController,
                                                beer: beer)
        let viewController = coordinator.start()
        navigationController.asyncPushViewController(viewController)
    }
}
