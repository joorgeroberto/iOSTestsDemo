//
//  AccountBalance.swift
//  TestsDemo
//
//  Created by Jorge de Carvalho on 23/12/21.
//

import UIKit

struct AccountBalance {
    let balance: Double
    
    func getSpecialLimit() -> Double {
        if balance < 100 {
            return balance + 10
        }
        if balance > 500 {
            return balance + 1000
        }
        return balance
    }
}
