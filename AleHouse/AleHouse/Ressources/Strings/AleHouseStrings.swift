//
//  AleHouseStrings.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import Foundation

enum AleHouseStrings {
    static let homeTitle = AleHouseStrings.localizable("Localizable", "home_title")
    static let homeSubTitle = AleHouseStrings.localizable("Localizable", "home_sub_title")
    static let homeStartButton = AleHouseStrings.localizable("Localizable", "home_start_button")
    static let beerListSearchBar = AleHouseStrings.localizable("Localizable", "beer_list_searchbar")
    static let genericErrorTitle = AleHouseStrings.localizable("Localizable", "generic_error_title")
    static let genericErrorDescription = AleHouseStrings.localizable("Localizable", "generic_error_description")
    static let emptyResponseErrorDescription = AleHouseStrings.localizable("Localizable", "empty_response_error_description")
    static let ok = AleHouseStrings.localizable("Localizable", "ok")
    
    private static func localizable(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = Bundle.main.localizedString(forKey: key, value: nil, table: table)
      return String(format: format, locale: Locale.current, arguments: args)
    }
}
