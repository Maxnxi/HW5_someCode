//
//  HW5Tests.swift
//  HW5Tests
//
//  Created by Ponomarev Maksim on 26.08.2022.
//

@testable import HW5
import XCTest

class HW5Tests: XCTestCase {

    var sut: NetworkService<MockNetworkClient<ItemP2>>!
    var client: MockNetworkClient<ItemP2>!

    override func setUp() {
        super.setUp()
        
        client = MockNetworkClient<ItemP2>()
        sut = NetworkService<MockNetworkClient<ItemP2>>(client: client)
    }
    
    override func tearDown() {
        client = nil
        sut = nil
        
        super.tearDown()
    }

    func testServiceCanReceiveResult() {
        let expectedItem = ItemP2(name: "test")
        var resultItem: ItemP2?
        client.stubResponse = expectedItem
        
        sut.fetchItem(at: 0) { (item, _) in
            resultItem = item
        }
        XCTAssertEqual(expectedItem, resultItem)
    }

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
