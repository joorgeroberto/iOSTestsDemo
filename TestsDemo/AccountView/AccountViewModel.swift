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
    var status: String { get set }
}

class AccountViewModel: AccountViewModelProtocol {
    private let shouldUseLocation: Bool
    private let model: AccountModel
    private let provider: ProviderProtocol
    var status: String
    
    init(shouldUseLocation: Bool, model: AccountModel, provider: ProviderProtocol = Provider()) {
        self.shouldUseLocation = shouldUseLocation
        self.model = model
        self.provider = provider
        self.status = ""
    }
    
    func getJoke() {
        provider.getJoke { result, error in
            if (error != nil) {
                self.status = "Error"
                return
            }
            self.status = result![0]
            return
        }
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
