//
//  AccountViewModelSpec.swift
//  TestsDemoTests
//
//  Created by Jorge de Carvalho on 24/12/21.
//

import Quick
import Nimble
@testable import TestsDemo

class AccountViewModelSpec: QuickSpec {
    override func spec() {
        describe("AccountViewModel") {
            var sut: AccountViewModel!
            
            var showAlert: Bool!
            var askUserPermission: Bool!
            var completion: Bool!
            
            beforeEach {
                showAlert = false
                askUserPermission = false
                completion = false
            }
            
            context("Should request location") {
                it("Use location true") {
                    sut = AccountViewModel(shouldUseLocation: true)

                    sut.shouldRequestLocation(showAlert: {
                        showAlert = true
                    }, askUserPermission: {
                        askUserPermission = true
                    }, completion: {
                        completion = true
                    })
                    
                    expect(showAlert).to(equal(false))
                    expect(askUserPermission).to(equal(true))
                    expect(completion).to(equal(true))
                }
                
                it("Use location false") {
                    sut = AccountViewModel(shouldUseLocation: false)

                    sut.shouldRequestLocation(showAlert: {
                        showAlert = true
                    }, askUserPermission: {
                        askUserPermission = true
                    }, completion: {
                        completion = true
                    })
                    
                    expect(showAlert).to(equal(true))
                    expect(askUserPermission).to(equal(false))
                    expect(completion).to(equal(true))
                }
            }
            
            context("AccountViewModelProtocol") {
                it("Verify if implements AccountViewModelProtocol") {
                    sut = AccountViewModel(shouldUseLocation: true)
                    expect(sut).to(beAKindOf(AccountViewModelProtocol.self))
                }
            }
        }
    }
}
