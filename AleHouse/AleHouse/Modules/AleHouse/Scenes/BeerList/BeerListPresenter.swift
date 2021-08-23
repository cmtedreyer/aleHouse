//
//  BeerListPresenter.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import Foundation

protocol BeerListPresentable: AnyObject {
    var viewController: BeerListDisplayable? { get set }
    func reloadBeerList()
    func displayError(_ error: Error)
    func displayLoading(_ isLoading: Bool)
}

final class BeerListPresenter {
    weak var viewController: BeerListDisplayable?
}
    
extension BeerListPresenter:  BeerListPresentable {
    func reloadBeerList() {
        viewController?.reloadTableView()
    }
    
    func displayError(_ error: Error) {
        viewController?.showError(error)
    }
    
    func displayLoading(_ isLoading: Bool) {
        viewController?.showLoading(isLoading)
    }
}
