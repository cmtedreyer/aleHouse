//
//  HomeView.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import UIKit

final class HomeView: UIView {
    lazy var titleLabel = BaseLabel(text: AleHouseStrings.homeTitle,
                                  color: .black,
                                  font: UIFont.bold(size: 24),
                                  alignment: .center)
    lazy var subTitleLabel = BaseLabel(text: AleHouseStrings.homeSubTitle,
                                     color: .gray,
                                     font: UIFont.regular(),
                                     alignment: .left)
    lazy var continueButton = BaseButton(title: AleHouseStrings.homeStartButton)
    lazy var labelStack = BaseStackView(axis: .vertical,
                                        distribution: .fill,
                                        alignment: .center)
    lazy var contentStack = BaseStackView(axis: .vertical,
                                          distribution: .fill,
                                          alignment: .fill,
                                          spacing: 48)
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        labelStack.addArrangedSubview(titleLabel)
        labelStack.addArrangedSubview(subTitleLabel)
        contentStack.addArrangedSubview(labelStack)
        contentStack.addArrangedSubview(continueButton)
        addSubview(contentStack)
    }
    
    private func setupConstraints() {
        contentStack.constraint {[
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 24),
            $0.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -24),
            $0.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ]}
    }
}
