//
//  HomeInteractorTests.swift
//  AleHouseTests
//
//  Created by Tiago Nunes Dreyer on 23/08/21.
//

@testable import AleHouse
import XCTest

private final class HomeCoordinatorSpy: HomeCoordinable {
    private(set) var navigateToBeerListCallsCount = 0
    
    func navigateBeerAleList() {
        navigateToBeerListCallsCount += 1
    }
}

final class HomeInteractorTests: XCTestCase {
    private var coordinatorSpy: HomeCoordinatorSpy!
    private var sut: HomeInteractor!
    
    override func setUp() {
        super.setUp()
        coordinatorSpy = HomeCoordinatorSpy()
        sut = HomeInteractor(coordinator: coordinatorSpy)
    }
    
    override func tearDown() {
        super.tearDown()
        coordinatorSpy = nil
        sut = nil
    }
    
    func testGoToBeerList_ShouldNavigateToBeerList() {
        sut.goToBeerList()
        
        XCTAssertEqual(coordinatorSpy.navigateToBeerListCallsCount, 1)
    }
}
