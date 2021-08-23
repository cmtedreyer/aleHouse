//
//  BeerDetailInteractor.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 23/08/21.
//

import Foundation

protocol BeerDetailInteractable: AnyObject {
    func getBeerInfo()
}

final class BeerDetailInteractor {
    private let presenter: BeerDetailPresentable
    private let beer: Beer
    
    init(presenter: BeerDetailPresentable,
         beer: Beer) {
        self.presenter = presenter
        self.beer = beer
    }
}

extension BeerDetailInteractor: BeerDetailInteractable {
    func getBeerInfo() {
        presenter.displayBeerDetail(beer)
    }
}
