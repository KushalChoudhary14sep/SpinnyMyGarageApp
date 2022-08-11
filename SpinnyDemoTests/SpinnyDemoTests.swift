//
//  SpinnyDemoTests.swift
//  SpinnyDemoTests
//
//  Created by Kushal Choudhary on 09/08/22.
//

import XCTest
@testable import SpinnyDemo

class SpinnyDemoTests: XCTestCase {
    
    private var makeID: Int = 0
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        self.checkCarMakeDataFetched()
        self.checkCarModelDataFetched()
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func checkCarMakeDataFetched() {
        let expectation = XCTestExpectation(description: "Check for car make API")
        CarRestManager.shared.getCarsMake { result in
            switch result {
            case .success(let response):
                XCTAssertTrue(response.count > 0)
                self.makeID = response.results.first?.makeID ?? 0
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
        wait(for: [expectation], timeout: 30)
    }
    
    func checkCarModelDataFetched() {
        let expectation = XCTestExpectation(description: "Check for car model API")
        CarRestManager.shared.getCarsModel(makeID: self.makeID) { result in
            switch result {
            case .success(let response):
                XCTAssertTrue(response.count > 0)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNil(error)
            }

        }
        wait(for: [expectation], timeout: 30)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
