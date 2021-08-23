//
//  BeerDetailInteractorTests.swift
//  AleHouseTests
//
//  Created by Tiago Nunes Dreyer on 23/08/21.
//

@testable import AleHouse
import XCTest

private final class BeerDetailPresenterSpy: BeerDetailPresentable {
    var viewController: BeerDetailDisplayable?
    
    private(set) var displayBeerDetailCallsCount = 0
    private(set) var beerReceived: Beer?
    
    func displayBeerDetail(_ beer: Beer) {
        displayBeerDetailCallsCount += 1
        beerReceived = beer
    }
}

final class BeerDetailInteractorTests: XCTestCase {
    private var presenterSpy: BeerDetailPresenterSpy!
    private var beerMock: Beer!
    private var sut: BeerDetailInteractor!
    
    override func setUp() {
        super.setUp()
        presenterSpy = BeerDetailPresenterSpy()
        beerMock = AleHouseSeeds.beer
        sut = BeerDetailInteractor(presenter: presenterSpy,
                                   beer: beerMock)
    }
    
    override func tearDown() {
        super.tearDown()
        presenterSpy = nil
        beerMock = nil
        sut = nil
    }
    
    func testGetBeerInfo_ShoudCallPresenterMethod() {
        sut.getBeerInfo()
        
        XCTAssertEqual(presenterSpy.displayBeerDetailCallsCount, 1)
        XCTAssertEqual(presenterSpy.beerReceived, beerMock)
    }
}
