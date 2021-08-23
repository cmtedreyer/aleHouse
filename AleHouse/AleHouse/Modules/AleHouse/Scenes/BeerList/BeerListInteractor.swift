//
//  BeerListInteractor.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import Foundation

protocol BeerListInteractable {
    func retrieveBeerList()
    func filterBeerListWith(text: String)
    func numberOfCells() -> Int
    func beerForRow(_ row: Int) -> Beer
    func openBeerDetail(_ row: Int)
}

final class BeerListInteractor {
    private let service: BeerListApi
    private let presenter: BeerListPresentable
    private let coordinator: BeerListCoordinable
    
    var beerResponse = [Beer]()
    var beerList = [Beer]()
    
    init(service: BeerListApi,
         presenter:BeerListPresentable,
         coordinator: BeerListCoordinable) {
        self.service = service
        self.presenter = presenter
        self.coordinator = coordinator
    }
}

extension BeerListInteractor: BeerListInteractable {
    func retrieveBeerList() {
        presenter.displayLoading(true)
        service.getBeerList { [self] response in
            presenter.displayLoading(false)
            switch response {
            case .success(let result):
                self.beerResponse = result
                self.beerList = result
                presenter.reloadBeerList()
            case .failure(let error):
                self.presenter.displayError(error)
            }
        }
    }
    
    func numberOfCells() -> Int {
        return beerList.count
    }
    
    func beerForRow(_ row: Int) -> Beer {
        return beerList[row]
    }
    
    func filterBeerListWith(text: String) {
        beerList = text.isEmpty ? beerResponse : beerResponse.filter({$0.name.lowercased().contains(text.lowercased())})
        presenter.reloadBeerList()
    }
    
    func openBeerDetail(_ row: Int) {
        let beer  = beerList[row]
        coordinator.navigateToBeerDetails(beer)
    }
}
