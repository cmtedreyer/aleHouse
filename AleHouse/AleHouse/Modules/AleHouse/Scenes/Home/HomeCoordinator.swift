//
//  HomeCoordinator.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import UIKit

protocol HomeCoordinable {
    func navigateBeerAleList()
}

final class HomeCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> UIViewController {
        let interactor = HomeInteractor(coordinator: self)
        let viewController = HomeViewController(interactor: interactor)
        return viewController
    }
}

extension HomeCoordinator: HomeCoordinable {
    func navigateBeerAleList() {
        let coordinator = BeerListCoordinator(navigationController: navigationController)
        let viewController = coordinator.start()
        navigationController.asyncPushViewController(viewController)
    }
}
