//
//  StringUtilsSpec.swift
//  TestsDemoTests
//
//  Created by Jorge de Carvalho on 23/12/21.
//

import XCTest
@testable import TestsDemo
class StringUtilsSpec: XCTestCase {

    // MARK: - Test func isValidEmail()
    func testIsValidEmail() {
        let email = "jorge@gmail.com"
        let isValid = email.isValidEmail()
        
        XCTAssertTrue(isValid, "Is not a valid email!")
    }
    
    func testIsInvalidEmail() {
        let email = "jorge"
        let isValid = email.isValidEmail()
        
        XCTAssertFalse(isValid, "Is not a invalid email!")
    }
    
    // MARK: - Test func removeWhitespace()
    func testRemoveWhitespace() {
        let text = "Hello test world!"
        let newText = text.removeWhitespace()
        
        XCTAssert(newText == "Hellotestworld!", "Whitespaces must be removed")
    }
    
    // MARK: - Test func replace()
    func testCorrectReplace() {
        let text = "Hello test world!"
        var replacedText = text.replace(string: " ", replacement: "_")
        
        XCTAssert(replacedText == "Hello_test_world!", "See if replaced string its correct")
        
        replacedText = replacedText.replace(string: "test_world", replacement: "world_test")
        XCTAssert(replacedText == "Hello_world_test!", "See if replaced string its correct")

    }
    
    func testIncorrectReplace() {
        let text = "Hello test world!"
        let replacedText = text.replace(string: " ", replacement: "_")
        
        XCTAssert(replacedText != "Hellotestworld!", "See if replaced string its incorrect")
    }

}
