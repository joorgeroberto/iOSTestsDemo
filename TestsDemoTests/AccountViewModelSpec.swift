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
                    sut = AccountViewModel(shouldUseLocation: true, model: AccountModel(instruction: ""))

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
                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel(instruction: ""))

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
                
                it("LoginButtonTap") {
                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel(instruction: ""))
                    expect(sut.loginButtonTap()).to(beVoid())
                }
            }
            
            context("AccountViewModelProtocol") {
                it("Verify if implements AccountViewModelProtocol") {
                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel(instruction: ""))
                    expect(sut).to(beAKindOf(AccountViewModelProtocol.self))
                }
            }
            
            context("Instruction Text") {
                it("Verify using location") {
                    sut = AccountViewModel(shouldUseLocation: true, model: AccountModel(instruction: "Hello World"))
                    expect(sut.instructionText).to(equal("Hello World com localização"))
                }
                
                it("Verify not using location") {
                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel(instruction: "Hello World"))
                    expect(sut.instructionText).to(equal("Hello World"))
                }
            }
            
            context("Get joke") {
                it("With error") {
                    sut = AccountViewModel(shouldUseLocation: true, model: AccountModel(instruction: "Hello World"), provider: ProviderMock(status: .invalidResponse))
                    sut.getJoke()
                    expect(sut.status).to(equal("Error"))
                }
                
                it("Without error") {
                    sut = AccountViewModel(shouldUseLocation: true, model: AccountModel(instruction: "Hello World"), provider: ProviderMock(status: .success))
                    sut.getJoke()
                    expect(sut.status).to(equal("animal"))
                }
            }
        }
    }
}
