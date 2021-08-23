//
//  Errors.swift
//  AleHouse
//
//  Created by Tiago Nunes Dreyer on 22/08/21.
//

import Foundation

struct EmptyResponseError: LocalizedError {
    var title: String = AleHouseStrings.genericErrorTitle
    var code: Int = 0
    var errorDescription: String? { return _description }
    var failureReason: String? { return _description }
    
    private var _description: String  = AleHouseStrings.emptyResponseErrorDescription
}


struct GenericError: LocalizedError {
    var title: String = AleHouseStrings.genericErrorTitle
    var code: Int = 0
    var errorDescription: String? { return _description }
    var failureReason: String? { return _description }

    private var _description: String =  AleHouseStrings.genericErrorDescription
}
