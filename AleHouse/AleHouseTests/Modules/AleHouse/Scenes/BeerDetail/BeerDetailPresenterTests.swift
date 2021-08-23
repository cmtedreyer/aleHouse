//
//  BeerDetailPresenterTests.swift
//  AleHouseTests
//
//  Created by Tiago Nunes Dreyer on 23/08/21.
//

@testable import AleHouse
import XCTest

private final class BeerDetailViewControllerSpy: BeerDetailDisplayable {
    private(set) var displayBeerDetailCallsCount = 0
    private(set) var beerReceived: Beer?
    
    func displayBeerDetail(_ beer: Beer) {
        displayBeerDetailCallsCount += 1
        beerReceived = beer
    }
}

final class BeerDetailPresenterTests: XCTestCase {
    private var viewControllerSpy: BeerDetailViewControllerSpy!
    private var sut: BeerDetailPResenter!
    
    override func setUp() {
        super.setUp()
        viewControllerSpy = BeerDetailViewControllerSpy()
        sut = BeerDetailPResenter()
        sut.viewController = viewControllerSpy
    }
    
    override func tearDown() {
        super.tearDown()
        viewControllerSpy = nil
        sut = nil
    }
    
    func testDisplayBeerDetail_ShouldCallViewMethod() {
        let beerMock = AleHouseSeeds.beer
        sut.displayBeerDetail(beerMock)
        
        XCTAssertEqual(viewControllerSpy.displayBeerDetailCallsCount, 1)
        XCTAssertEqual(viewControllerSpy.beerReceived, beerMock)
    }
}
