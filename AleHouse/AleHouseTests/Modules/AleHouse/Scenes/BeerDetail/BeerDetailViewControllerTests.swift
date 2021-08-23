//
//  BeerDetailViewControllerTests.swift
//  AleHouseTests
//
//  Created by Tiago Nunes Dreyer on 23/08/21.
//

@testable import AleHouse
import XCTest

private final class BeerDetailInteractorSpy: BeerDetailInteractable {
    private(set) var getBeerInfoCallsCount = 0
    
    func getBeerInfo() {
        getBeerInfoCallsCount += 1
    }
}

final class BeerDetailViewControllerTests: XCTestCase {
    private var interactorSpy: BeerDetailInteractorSpy!
    private var sut: BeerDetailViewController!
    
    override func setUp() {
        super.setUp()
        interactorSpy = BeerDetailInteractorSpy()
        sut = BeerDetailViewController(interactor: interactorSpy)
    }
    
    override func tearDown() {
        super.tearDown()
        interactorSpy = nil
        sut = nil
    }
    
    func testViewWillAppear_ShouldGetBeerInfo() {
        sut.viewWillAppear(true)
        
        XCTAssertEqual(interactorSpy.getBeerInfoCallsCount, 1)
    }
}
