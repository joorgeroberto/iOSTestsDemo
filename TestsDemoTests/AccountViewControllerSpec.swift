//
//  AccountViewControllerSpec.swift
//  TestsDemoTests
//
//  Created by Jorge de Carvalho on 24/12/21.
//

import Quick
import Nimble
@testable import TestsDemo

class AccountViewModelMock: AccountViewModelProtocol {
    var loginButtonHasBeenCalled = false
    
    func loginButtonTap() {
        loginButtonHasBeenCalled = true
    }
    
    func shouldRequestLocation(showAlert: () -> (), askUserPermission: () -> (), completion: () -> ()) {}
}

class AccountViewControllerSpec: QuickSpec {
    override func spec() {
        describe("AccountViewController") {
            var sut: AccountViewController!
            var sutMock: AccountViewModelMock!
            
            beforeEach {
                sut = AccountViewController(nibName: "AccountViewController", bundle: nil)
                sutMock = AccountViewModelMock()
                sut.viewModel = sutMock
            }
            context("Actions") {
                it("Login Button Tap") {
                    sut.loginButtonAction(UIButton())
                    expect(sutMock.loginButtonHasBeenCalled).to(beTrue())
                }
            }
        }
    }
}
