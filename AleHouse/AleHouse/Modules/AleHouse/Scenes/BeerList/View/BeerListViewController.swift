//
//  BeerListViewController.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import UIKit

protocol BeerListDisplayable: AnyObject {
    func reloadTableView()
    func showError(_ error: Error)
    func showLoading(_ isLoading: Bool)
}

final class BeerListViewController: UIViewController {
    private lazy var searchBar = BaseSearchBar(placeHolder: AleHouseStrings.beerListSearchBar)
    private var beerListView: BeerListView!
    private let interactor: BeerListInteractable
    
    init(interactor: BeerListInteractable) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.retrieveBeerList()
    }
    
    override func loadView() {
        super.loadView()
        beerListView = BeerListView()
        view = beerListView
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
    
    func setupTableView() {
        beerListView.tableView.delegate = self
        beerListView.tableView.dataSource = self
        beerListView.tableView.register(BeerListTableViewCell.self, forCellReuseIdentifier: AleHouseConstants.BeerList.cellIdentifier)
    }
}

extension BeerListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        interactor.filterBeerListWith(text: textSearched)
    }
}

extension BeerListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.numberOfCells()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AleHouseConstants.BeerList.cellIdentifier, for: indexPath) as! BeerListTableViewCell
        let beer = interactor.beerForRow(indexPath.row)
        cell.setup(beer: beer)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.openBeerDetail(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension BeerListViewController: BeerListDisplayable {
    func reloadTableView() {
        beerListView.tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        let alert = UIAlertController(title: AleHouseStrings.genericErrorTitle, message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: AleHouseStrings.ok, style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func showLoading(_ isLoading: Bool) {
        beerListView.startLoading(isLoading)
    }
}
