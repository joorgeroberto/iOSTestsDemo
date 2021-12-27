//
//  AsyncProcessTests.swift
//  TestsDemoTests
//
//  Created by Jorge de Carvalho on 27/12/21.
//

import Quick
import Nimble
@testable import TestsDemo

class AsyncProcessTests: QuickSpec {
    override func spec() {
        describe("Acync Process") {
            context("callThatResultsInSideEffect") {
                it("Test") {
                    let asyncProcess = AsyncProcess()
                    asyncProcess.callThatResultsInSideEffect()
                    //toEventually is used in async tests and process.
                    expect(asyncProcess.name).toEventually(equal("TestsDemo"))
                }
            }
        }
    }
}
