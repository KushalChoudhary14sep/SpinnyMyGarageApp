//
//  SignupVM.swift
//  SpinnyDemo
//
//  Created by Kushal Choudhary on 10/08/22.
//

import Foundation
import UIKit

protocol UserSignedUpDelegate: AnyObject {
    func success()
    func error(message: String)
}

class SignupViewModel: NSObject {
    weak var view: SignupView?
    weak var delegate: UserSignedUpDelegate?
    var userName: String?
    var password: String?
    
    
    private func saveUserToDB() {
        guard let userName = userName else {
            return
        }
        let user = RealmManager.shared.realm.objects(User.self).filter("username == %@", userName).first
        if user != nil {
            self.delegate?.error(message: AppConstant.userExistErrorMsg)
        } else {
            UserManager.shared.saveUserToDB(user: User(username: self.view?.usernameTextField.text ?? "", password: self.view?.passwordTextField.text ?? ""))
            UserManager.shared.currentLoggedInUserName = self.view?.usernameTextField.text
            self.delegate?.success()
        }
    }
}

extension SignupViewModel: SignupUserDelegate {
    func signup() {
        self.saveUserToDB()
    }
}
