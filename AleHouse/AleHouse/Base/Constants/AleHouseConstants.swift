//
//  AleHouseConstants.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import Foundation

enum AleHouseConstants {
    enum EndPoints {
        static let baseUrl = "https://api.punkapi.com/v2/"
        static let beerList = baseUrl+"beers"
    }
    enum BeerList {
        static let cellIdentifier = "beerListCell"
    }
}
