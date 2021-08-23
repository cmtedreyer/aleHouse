//
//  BeerListTableViewCell.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import UIKit

final class BeerListTableViewCell: UITableViewCell {
    lazy var iconImageView = DownloadImageView(frame: CGRect.zero)
    lazy var titleLabel = BaseLabel(text: "",
                                    color: .black,
                                    font: .bold(size: 14),
                                    alignment: .left)
    lazy var descriptionLabel = BaseLabel(text: "",
                                    color: .gray,
                                    font: .regular(size: 10),
                                    alignment: .left)
    lazy var textStack = BaseStackView(axis: .vertical,
                                       distribution: .fill,
                                       alignment: .leading,
                                       spacing: 4)
    lazy var contentStack = BaseStackView(axis: .horizontal,
                                          distribution: .fill,
                                          alignment: .leading,
                                          spacing: 16)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        textStack.addArrangedSubview(titleLabel)
        textStack.addArrangedSubview(descriptionLabel)
        contentStack.addArrangedSubview(iconImageView)
        contentStack.addArrangedSubview(textStack)
        contentView.addSubview(contentStack)
    }
    
    func setupConstraints() {
        iconImageView.constraint {[
            $0.widthAnchor.constraint(equalToConstant: 40),
            $0.heightAnchor.constraint(equalToConstant: 60)
        ]}
        contentStack.constraint {[
            $0.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            $0.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ]}
    }
    
    func setup(beer: Beer) {
        titleLabel.text = beer.name
        descriptionLabel.text = beer.tagline
        iconImageView.setUrl(beer.image_url, cache: true)
        iconImageView.contentMode = .scaleAspectFit
    }
}
