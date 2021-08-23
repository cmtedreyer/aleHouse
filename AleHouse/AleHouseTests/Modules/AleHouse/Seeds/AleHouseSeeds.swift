//
//  AleHouseSeeds.swift
//  AleHouseTests
//
//  Created by Tiago Nunes Dreyer on 23/08/21.
//

@testable import AleHouse
import Foundation

struct AleHouseSeeds {
    static let beer = Beer(name: "Example beer",
                           tagline: "Example beer tagline",
                           description: "Example beer description",
                           image_url: "Example beer image url")
    static let beerResponse = [Beer(name: "Example beer 1",
                                    tagline: "Example beer tagline 1",
                                    description: "Example beer description 1",
                                    image_url: "Example beer image url 1"),
                               Beer(name: "Example beer 2",
                                    tagline: "Example beer tagline 2",
                                    description: "Example beer description 2",
                                    image_url: "Example beer image url 2")]
}
