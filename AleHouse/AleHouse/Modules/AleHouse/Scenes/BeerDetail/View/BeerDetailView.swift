//
//  BeerDetailView.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 23/08/21.
//

import UIKit

final class BeerDetailView: UIView {
    lazy var titleLabel = BaseLabel(text: "",
                                    color: .black,
                                    font: .bold(size: 24),
                                    alignment: .center)
    lazy var iconImageView = DownloadImageView(frame: CGRect.zero)
    lazy var taglineLabel = BaseLabel(text: "",
                                    color: .black,
                                    font: .bold(size: 16),
                                    alignment: .left)
    lazy var descriptionLabel = BaseLabel(text: "",
                                    color: .gray,
                                    font: .regular(size: 12),
                                    alignment: .left)
    lazy var textStack = BaseStackView(axis: .vertical,
                                       distribution: .fill,
                                       alignment: .leading,
                                       spacing: 16)
    lazy var contentStack = BaseStackView(axis: .vertical,
                                          distribution: .fill,
                                          alignment: .fill,
                                          spacing: 24)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        contentStack.addArrangedSubview(titleLabel)
        contentStack.addArrangedSubview(iconImageView)
        textStack.addArrangedSubview(taglineLabel)
        textStack.addArrangedSubview(descriptionLabel)
        contentStack.addArrangedSubview(textStack)
        addSubview(contentStack)
    }
    
    func setupConstraints() {
        iconImageView.constraint {[
            $0.heightAnchor.constraint(equalToConstant: 200)
        ]}
        contentStack.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ]}
    }
    
    func setup(beer: Beer) {
        titleLabel.text = beer.name
        taglineLabel.text = beer.tagline
        descriptionLabel.text = beer.description
        iconImageView.setUrl(beer.image_url, cache: true)
        iconImageView.contentMode = .scaleAspectFit
    }
    
}
