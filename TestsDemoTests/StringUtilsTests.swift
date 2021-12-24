//
//  StringUtilsTests.swift
//  TestsDemoTests
//
//  Created by Jorge de Carvalho on 24/12/21.
//

import Quick
import Nimble
@testable import TestsDemo

class StringUtilsTests: QuickSpec {
    override func spec() {
        describe("StringUtils") {
            context("Is valid Email") {
                it("Valid email") {
                    let email = "jorge@gmail.com"
                    let isEmailValid = email.isValidEmail()
                    
                    expect(isEmailValid).to(be(true))
                }
                
                it("Invalid email") {
                    let email = "jorge"
                    let isEmailValid = email.isValidEmail()
                    
                    expect(isEmailValid).to(be(false))
                }
            }
        }
        
        context("Remove Whitespaces") {
            it("Removing whitespaces") {
                let text = "Hello Test World!"
                let newText = text.removeWhitespace()
                
                expect(newText).to(equal("HelloTestWorld!"))
            }
        }
        
        context("Replace text") {
            it("Correct replacement") {
                let text = "Hello test world!"
                var replacedText = text.replace(string: " ", replacement: "_")
                
                expect(replacedText).to(equal("Hello_test_world!"))
                
                replacedText = replacedText.replace(string: "test_world", replacement: "world_test")
                expect(replacedText).to(equal("Hello_world_test!"))
            }
            
            it("Incorrect replacement") {
                let text = "Hello test world!"
                let replacedText = text.replace(string: " ", replacement: "_")
            
                expect(replacedText).toNot(equal("Hellotestworld!"))
                
            }
        }
    }
}
