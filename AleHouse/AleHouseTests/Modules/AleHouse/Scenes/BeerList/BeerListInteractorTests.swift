//
//  BeerListInteractorTests.swift
//  AleHouseTests
//
//  Created by Tiago Nunes Dreyer on 23/08/21.
//

@testable import AleHouse
import XCTest

private final class BeerListServiceMock: BeerListApi {
    var isSuccess = true
    var errorResponse = GenericError()
    
    func getBeerList(completion: @escaping ((Result<[Beer], Error>) -> Void)) {
        let response = AleHouseSeeds.beerResponse
        isSuccess ? completion(.success(response)) : completion(.failure(errorResponse))
    }
}

private final class BeerListPresenterSpy: BeerListPresentable {
    var viewController: BeerListDisplayable?
    private(set) var reloadBeerListCallsCount = 0
    private(set) var displayErrorCallsCount = 0
    private(set) var displayLoadingCallsCount = 0
    private(set) var errorReceived: Error?
    private(set) var isLoadingReceived: Bool?
    
    func reloadBeerList() {
        reloadBeerListCallsCount += 1
    }
    
    func displayError(_ error: Error) {
        displayErrorCallsCount += 1
        errorReceived = error
    }
    
    func displayLoading(_ isLoading: Bool) {
        displayLoadingCallsCount += 1
        isLoadingReceived = isLoading
    }
}

private final class BeerListCoordinatorSpy: BeerListCoordinable {
    private(set) var navigateToBeerDetailsCallsCount = 0
    private(set) var beerReceived: Beer?
    
    func navigateToBeerDetails(_ beer: Beer) {
        navigateToBeerDetailsCallsCount += 1
        beerReceived = beer
    }
}

final class BeerListInteractorTests: XCTestCase {
    private var serviceMock: BeerListServiceMock!
    private var presenterSpy: BeerListPresenterSpy!
    private var coordinatorSpy: BeerListCoordinatorSpy!
    private var sut: BeerListInteractor!
    
    override func setUp() {
        super.setUp()
        serviceMock = BeerListServiceMock()
        presenterSpy = BeerListPresenterSpy()
        coordinatorSpy = BeerListCoordinatorSpy()
        sut = BeerListInteractor(service: serviceMock,
                                 presenter: presenterSpy,
                                 coordinator: coordinatorSpy)
    }
    
    override func tearDown() {
        super.tearDown()
        serviceMock = nil
        presenterSpy = nil
        coordinatorSpy = nil
        sut = nil
    }
    
    func testRetrieveBeerList_WhenServiceCallIsSuccess_ShouldPopulateBeerList() {
        serviceMock.isSuccess = true
        sut.retrieveBeerList()
        
        XCTAssertEqual(presenterSpy.reloadBeerListCallsCount, 1)
        XCTAssertEqual(presenterSpy.displayLoadingCallsCount, 2)
        XCTAssertEqual(sut.beerResponse.count, 2)
        XCTAssertEqual(sut.beerList.count, 2)
    }
    
    func testRetrieveBeerList_WhenServiceCallIsFailure_ShouldDisplayError() {
        serviceMock.isSuccess = false
        sut.retrieveBeerList()
        
        XCTAssertEqual(presenterSpy.displayErrorCallsCount, 1)
        XCTAssertNotNil(presenterSpy.errorReceived)
        XCTAssertEqual(presenterSpy.displayLoadingCallsCount, 2)
        XCTAssertEqual(sut.beerResponse.count, 0)
        XCTAssertEqual(sut.beerList.count, 0)
    }
    
    func testFilterBeerList_WhenListFilterIsValid_ShoudHavefilteredItem() {
        let filterTextMock =  "beer 1"
        serviceMock.isSuccess = true
        sut.retrieveBeerList()
        sut.filterBeerListWith(text: filterTextMock)
        
        XCTAssertEqual(sut.beerResponse.count, 2)
        XCTAssertEqual(sut.beerList.count, 1)
    }
    
    func testFilterBeerList_WhenFilterIsNotValid_ShoudNotHavefilteredItem() {
        let filterTextMock =  "None"
        serviceMock.isSuccess = true
        sut.retrieveBeerList()
        sut.filterBeerListWith(text: filterTextMock)
        
        XCTAssertEqual(sut.beerResponse.count, 2)
        XCTAssertEqual(sut.beerList.count, 0)
    }
    
    func testNumberOfCells_ShouldReturnNumberOfFilteredItems() {
        serviceMock.isSuccess = true
        sut.retrieveBeerList()
        let numberOfCells = sut.numberOfCells()
        
        XCTAssertEqual(sut.beerList.count, numberOfCells)
    }
    
    func testBeerForRow_ShouldReturnValidItem() {
        let rowMock = 1
        serviceMock.isSuccess = true
        sut.retrieveBeerList()
        let expectedBeer = sut.beerList[rowMock]
        let item = sut.beerForRow(rowMock)
        
        XCTAssertEqual(expectedBeer, item)
    }
    
    func testOpenBeerDetail_ShouldNavigateToBeerDetail() {
        let rowMock = 1
        serviceMock.isSuccess = true
        sut.retrieveBeerList()
        let expectedBeer = sut.beerList[rowMock]
        sut.openBeerDetail(rowMock)
        
        XCTAssertEqual(coordinatorSpy.navigateToBeerDetailsCallsCount, 1)
        XCTAssertEqual(coordinatorSpy.beerReceived, expectedBeer)
    }
}
