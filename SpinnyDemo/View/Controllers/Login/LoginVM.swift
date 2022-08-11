//
//  LoginVM.swift
//  SpinnyDemo
//
//  Created by Kushal Choudhary on 10/08/22.
//

import Foundation
import UIKit

protocol LoginDetailsFetched: AnyObject {
    func success()
    func error()
}

class LoginViewModel: NSObject {
    weak var view: LoginView?
    weak var delegate: LoginDetailsFetched?
    
    private func fetchUserFromDB() {
        let user = UserManager.shared.getUser(username: self.view?.usernameTextField.text ?? "", password: self.view?.passwordTextField.text ?? "")
         if user != nil {
             UserManager.shared.currentLoggedInUserName = user?.username
             self.delegate?.success()
         } else {
             self.delegate?.error()
         }
    }
}

extension LoginViewModel: FetchLoginDetails {
    func checkUser() {
        self.fetchUserFromDB()
    }
}
