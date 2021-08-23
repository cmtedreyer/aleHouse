//
//  Beer.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import Foundation

struct Beer: Codable, Equatable {
    let name: String
    let tagline: String
    let description: String
    let image_url: String
}
