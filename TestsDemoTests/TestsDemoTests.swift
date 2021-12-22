//
//  TestsDemoTests.swift
//  TestsDemoTests
//
//  Created by Jorge de Carvalho on 22/12/21.
//

import XCTest
@testable import TestsDemo

class TestsDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("1 - Antes do teste")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("3 - Depois do teste")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        print("2 - Durante o teste")
        XCTAssert(1+1 == 2)
    }

}
