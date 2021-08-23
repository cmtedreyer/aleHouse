//
//  BeerDetailViewController.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 23/08/21.
//

import UIKit

protocol BeerDetailDisplayable: AnyObject {
    func displayBeerDetail(_ beer: Beer)
}

final class BeerDetailViewController: UIViewController {
    private var beerDetailView: BeerDetailView!
    private let interactor: BeerDetailInteractable
    
    init(interactor: BeerDetailInteractable) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.getBeerInfo()
    }
    
    override func loadView() {
        super.loadView()
        beerDetailView = BeerDetailView()
        view = beerDetailView
    }
}

extension BeerDetailViewController: BeerDetailDisplayable {
    func displayBeerDetail(_ beer: Beer) {
        beerDetailView.setup(beer: beer)
    }
}
