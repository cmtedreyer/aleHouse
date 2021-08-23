//
//  HomeViewController.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import UIKit

final class HomeViewController: UIViewController {
    private var homeView: HomeView!
    private let interactor: HomeInteractable
    
    init(interactor: HomeInteractable) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setActions()
    }
    
    override func loadView() {
        super.loadView()
        homeView = HomeView()
        view = homeView
    }
    
    private func setActions() {
        homeView.continueButton.addTarget(self, action: #selector(goToBeerList), for: .touchUpInside)
    }
    
    @objc func goToBeerList() {
        interactor.goToBeerList()
    }
}
