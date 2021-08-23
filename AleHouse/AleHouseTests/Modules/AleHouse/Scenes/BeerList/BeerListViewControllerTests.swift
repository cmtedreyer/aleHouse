//
//  BeerListViewControllerTests.swift
//  AleHouseTests
//
//  Created by Tiago Nunes Dreyer on 23/08/21.
//

@testable import AleHouse
import XCTest

private final class BeerListInteractorSpy: BeerListInteractable {
    private(set) var retrieveBeerListCallsCount = 0
    private(set) var filterBeerListWithCallsCount = 0
    private(set) var numberOfCellsCallsCount = 0
    private(set) var beerForRowCallsCount = 0
    private(set) var openBeerDetailCallsCount = 0
    private(set) var textReceived: String?
    private(set) var rowReceived: Int?
    
    func retrieveBeerList() {
        retrieveBeerListCallsCount += 1
    }
    
    func filterBeerListWith(text: String) {
        filterBeerListWithCallsCount += 1
        textReceived = text
    }
    
    func numberOfCells() -> Int {
        numberOfCellsCallsCount += 1
        return numberOfCellsCallsCount
    }
    
    func beerForRow(_ row: Int) -> Beer {
        beerForRowCallsCount += 1
        rowReceived = row
        return AleHouseSeeds.beer
    }
    
    func openBeerDetail(_ row: Int) {
        openBeerDetailCallsCount += 1
        rowReceived = row
    }
}

final class BeerListViewControllerTests: XCTestCase {
    private var interactorSpy: BeerListInteractorSpy!
    private var sut: BeerListViewController!
    
    override func setUp() {
        super.setUp()
        interactorSpy = BeerListInteractorSpy()
        sut = BeerListViewController(interactor: interactorSpy)
    }
    
    override func tearDown() {
        super.tearDown()
        interactorSpy = nil
        sut = nil
    }
    
    func testViewWillAppear_ShouldRetrieveBeerList() {
        sut.viewWillAppear(true)
        
        XCTAssertEqual(interactorSpy.retrieveBeerListCallsCount, 1)
    }
}
