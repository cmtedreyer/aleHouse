//
//  HomeViewControllerTests.swift
//  AleHouseTests
//
//  Created by Tiago Nunes Dreyer on 23/08/21.
//

@testable import AleHouse
import XCTest

private final class HomeInteractorSpy: HomeInteractable {
    private(set) var goToBeerListCallsCount = 0
    func goToBeerList() {
        goToBeerListCallsCount += 1
    }
}

final class HomeViewControllerTests: XCTestCase {
    private var interactorSpy: HomeInteractorSpy!
    private var sut: HomeViewController!
    
    override func setUp() {
        super.setUp()
        interactorSpy = HomeInteractorSpy()
        sut = HomeViewController(interactor: interactorSpy)
    }
    
    override func tearDown() {
        super.tearDown()
        interactorSpy = nil
        sut = nil
    }
    
    func testGoToBeerList_ShouldCallInteractorMethod() {
        sut.goToBeerList()
        
        XCTAssertEqual(interactorSpy.goToBeerListCallsCount, 1)
    }
}
