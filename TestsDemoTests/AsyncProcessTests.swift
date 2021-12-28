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
                it("Test using toEventually") {
                    let asyncProcess = AsyncProcess()
                    asyncProcess.callThatResultsInSideEffect()
                    // toEventually is used in async tests and process.
                    expect(asyncProcess.name).toEventually(equal("TestsDemo"))
                }
                
                it("Do Stuff test using waitUntil") {
                    let asyncProcess = AsyncProcess()
                    // waitUntil is used to async tests that have no return
                    waitUntil { done in
                        asyncProcess.doStuff { result in
                            expect(result).to(equal("TestsDemo"))
                            done()
                        }
                    }
                }
            }
        }
    }
}
