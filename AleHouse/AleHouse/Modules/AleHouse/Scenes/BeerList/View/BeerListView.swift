//
//  BeerListView.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import UIKit

final class BeerListView: UIView {
    lazy var tableView = UITableView()
    lazy var loadingView = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        addSubview(tableView)
        addSubview(loadingView)
        loadingView.style = .large
        loadingView.isHidden = true
    }
    
    private func setupConstraints() {
        tableView.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]}
        loadingView.constraint {[
            $0.centerYAnchor.constraint(equalTo: centerYAnchor),
            $0.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]}
    }
    
    func startLoading(_ isLoading: Bool) {
        loadingView.isHidden = !isLoading
        isLoading ? loadingView.startAnimating() : loadingView.stopAnimating()
    }
}
