//
//  AccountViewController.swift
//  TestsDemo
//
//  Created by Jorge de Carvalho on 24/12/21.
//

import UIKit

class AccountViewController: UIViewController {
    var viewModel: AccountViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.shouldRequestLocation(showAlert: {
            print("Alert")
        }, askUserPermission: {
            print("Get User Location")
        }, completion: {
            print("Completion")
        })
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        viewModel?.loginButtonTap()
    }
}
