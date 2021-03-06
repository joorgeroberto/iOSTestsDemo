//
//  AsyncProcess.swift
//  TestsDemo
//
//  Created by Jorge de Carvalho on 27/12/21.
//

import UIKit

class AsyncProcess {
    var name = ""
    
    func doStuff(_ completion: @escaping (String) -> ()) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.1) { [weak self] in
            completion("TestsDemo")
        }
    }
    
    func callThatResultsInSideEffect() {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.name = "TestsDemo"
        }
    }
}
