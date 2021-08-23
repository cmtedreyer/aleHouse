//
//  HomeInteractor.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import Foundation

protocol HomeInteractable: AnyObject {
    func goToBeerList()
}

final class HomeInteractor {
    private let coordinator: HomeCoordinable
    
    init(coordinator: HomeCoordinable) {
        self.coordinator = coordinator
    }
}

extension HomeInteractor: HomeInteractable {
    func goToBeerList() {
        coordinator.navigateBeerAleList()
    }
}
