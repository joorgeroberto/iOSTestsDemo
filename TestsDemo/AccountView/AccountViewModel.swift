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
    
    var instructionText: String { get }
}

class AccountViewModel: AccountViewModelProtocol {
    private let shouldUseLocation: Bool
    private let model: AccountModel
    
    init(shouldUseLocation: Bool, model: AccountModel) {
        self.shouldUseLocation = shouldUseLocation
        self.model = model
    }
}

extension AccountViewModel {
    var instructionText: String {
        if shouldUseLocation {
            return model.instruction + " com localização"
        }
        return model.instruction
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

/*
 class AccountViewModel: AccountViewModelProtocol {
     private let shouldUseLocation: Bool
     private let model: AccountModel
     
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
 
 */
