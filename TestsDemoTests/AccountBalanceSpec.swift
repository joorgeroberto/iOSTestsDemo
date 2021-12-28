//
//  AccountBalanceSpec.swift
//  TestsDemoTests
//
//  Created by Jorge de Carvalho on 23/12/21.
//

import XCTest
@testable import TestsDemo

class AccountBalanceSpec: XCTestCase {
    var account: AccountBalance?

    func testGetSpecialLimit99() {
        account = AccountBalance(balance: 99)
        let specialLimit = account?.getSpecialLimit()
        
        XCTAssertEqual(specialLimit, 109, "The balance less than 100 must return the balance + 10")
    }
    
    func testGetSpecialLimit900() {
        account = AccountBalance(balance: 900)
        let specialLimit = account?.getSpecialLimit()
        
        XCTAssertEqual(specialLimit, 1900, "The balance greater than 500 must return the balance + 1000")
    }
    
    func testGetSpecialLimit400() {
        account = AccountBalance(balance: 400)
        let specialLimit = account?.getSpecialLimit()
        
        XCTAssertEqual(specialLimit, 400, "The balance less than 500 and greater than 100 must return the original balance")
    }
}
