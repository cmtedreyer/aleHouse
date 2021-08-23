//
//  BeerDetailPresenter.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 23/08/21.
//

import Foundation

protocol BeerDetailPresentable: AnyObject {
    var viewController: BeerDetailDisplayable? { get set }
    func displayBeerDetail(_ beer: Beer)
}

final class BeerDetailPResenter {
    weak var viewController: BeerDetailDisplayable?
}

extension BeerDetailPResenter: BeerDetailPresentable {
    func displayBeerDetail(_ beer: Beer) {
        viewController?.displayBeerDetail(beer)
    }
}
