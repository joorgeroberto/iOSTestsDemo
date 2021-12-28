//
//  ProviderMock.swift
//  TestsDemoTests
//
//  Created by Jorge de Carvalho on 27/12/21.
//

import UIKit
import Quick
@testable import TestsDemo

class ProviderMock: ProviderProtocol {
    enum Status {
        case success
        case noData
        case invalidResponse
    }
    
    let status: Status
    init(status: Status) {
        self.status = status
    }
    
    func getJoke(_ completion: @escaping ([String]?, JokeError?) -> ()) {
        switch status {
        case .success:
            completion([
                "animal",
                "career",
                "celebrity",
                "dev",
                "explicit",
                "fashion",
                "food",
                "history",
                "money",
                "movie",
                "music",
                "political",
                "religion",
                "science",
                "sport",
                "travel"
            ], nil)
        case .noData:
            completion(nil, .noData)
        case .invalidResponse:
            completion(nil, .invalidResponse)
        }
    }
    
    
}
