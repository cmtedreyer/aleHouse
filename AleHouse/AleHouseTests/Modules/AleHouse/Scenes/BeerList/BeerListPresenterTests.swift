//
//  BeerListPresenterTests.swift
//  AleHouseTests
//
//  Created by Tiago Nunes Dreyer on 23/08/21.
//

@testable import AleHouse
import XCTest

private final class BeerListViewControllerSpy: BeerListDisplayable {
    private(set) var reloadTableViewCallsCount = 0
    private(set) var showErrorCallsCount = 0
    private(set) var showLoadingCallsCount = 0
    private(set) var errorReceived: Error?
    private(set) var isLoadingReceived: Bool?
    
    func reloadTableView() {
        reloadTableViewCallsCount += 1
    }
    
    func showError(_ error: Error) {
        showErrorCallsCount += 1
        errorReceived = error
    }
    
    func showLoading(_ isLoading: Bool) {
        showLoadingCallsCount += 1
        isLoadingReceived = isLoading
    }
}

final class BeerListPresenterTests: XCTestCase {
    private var viewControllerSpy: BeerListViewControllerSpy!
    private var sut: BeerListPresenter!
    
    override func setUp() {
        super.setUp()
        viewControllerSpy = BeerListViewControllerSpy()
        sut = BeerListPresenter()
        sut.viewController = viewControllerSpy
    }
    
    override func tearDown() {
        super.tearDown()
        viewControllerSpy = nil
        sut = nil
    }
    
    func testReloadViewList_ShouldCallViewMethod() {
        sut.reloadBeerList()
        
        XCTAssertEqual(viewControllerSpy.reloadTableViewCallsCount, 1)
    }
    
    func testDisplayError_ShouldCallViewMethod() {
        let errorMock = GenericError()
        sut.displayError(errorMock)
        
        XCTAssertEqual(viewControllerSpy.showErrorCallsCount, 1)
        XCTAssertNotNil(viewControllerSpy.errorReceived)
    }
    
    func testDisplayLoading_ShouldCallViewMethod() {
        let isLoadingMock = true
        sut.displayLoading(isLoadingMock)
        
        XCTAssertEqual(viewControllerSpy.showLoadingCallsCount, 1)
        XCTAssertEqual(viewControllerSpy.isLoadingReceived, isLoadingMock)
    }
}
