//
//  SignupUIC.swift
//  SpinnyDemo
//
//  Created by Kushal Choudhary on 09/08/22.
//

import Foundation
import UIKit

protocol SignupUserDelegate: AnyObject {
    func signup()
}

class SignupUIController: NSObject {
    
    weak var view: SignupView? {
        didSet {
            setupAddTargets()
        }
    }
    weak var delegate: SignupUserDelegate?
    
    private func setupAddTargets() {
        self.view?.signupButton.addTarget(self, action: #selector(didTapOnSignupButton), for: .touchUpInside)
        self.view?.loginButton.addTarget(self, action: #selector(didTapOnloginButton), for: .touchUpInside)
    }
    
    @objc private func didTapOnSignupButton() {
        if self.view?.usernameTextField.text != "" && self.view?.passwordTextField.text != "" {
            self.delegate?.signup()
        } else {
            (self.view as? UIViewController)?.showAlert(title: AppConstant.alert, message: AppConstant.enterUserDetailsErrorMsg, comletion: nil)
        }
    }
    
    @objc private func didTapOnloginButton() {
        let vc = view as? UIViewController
        vc?.presentVC(storyBoard: AppConstant.storybardName, identifier: AppConstant.loginVCIdentifier)
    }
    
}

extension SignupUIController: UserSignedUpDelegate {
    func success() {
        let vc = view as? UIViewController
        (self.view as? UIViewController)?.showToast(message: AppConstant.signupSuccessToastMsg)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            vc?.presentVC(storyBoard: AppConstant.storybardName, identifier: AppConstant.dashboardVCIdentifier)
        }
    }
    
    func error(message: String) {
        (self.view as? UIViewController)?.showAlert(title: AppConstant.alert, message: message, comletion: nil)
    }
}
