//
//  AccountViewModel.swift
//  TestsDemo
//
//  Created by Jorge de Carvalho on 24/12/21.
//

import UIKit

protocol AccountViewModelProtocol {
    func loginButtonTap()
    func shouldRequestLocation(showAlert: () -> (),
                               askUserPermission: () -> (),
                               completion: () -> ()
    )
}

class AccountViewModel: AccountViewModelProtocol {
    private let shouldUseLocation: Bool
    
    init(shouldUseLocation: Bool) {
        self.shouldUseLocation = shouldUseLocation
    }
    
    func loginButtonTap() {
        print("Login Successful")
    }
    
    func shouldRequestLocation(showAlert: () -> (),
                               askUserPermission: () -> (),
                               completion: () -> ()) {
        if(shouldUseLocation) {
            askUserPermission()
            completion()
            return
        }
        showAlert()
        completion()
    }
}
