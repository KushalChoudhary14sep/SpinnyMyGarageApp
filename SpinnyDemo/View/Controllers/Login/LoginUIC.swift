//
//  LoginUIC.swift
//  SpinnyDemo
//
//  Created by Kushal Choudhary on 09/08/22.
//

import Foundation
import UIKit

protocol FetchLoginDetails: AnyObject {
    func checkUser()
}

class LoginUIController: NSObject {
    
    weak var view: LoginView? {
        didSet {
            setupAddTargets()
        }
    }
    weak var delegate: FetchLoginDetails?
    
    private func setupAddTargets() {
        self.view?.signupButton.addTarget(self, action: #selector(didTapOnSignupButton), for: .touchUpInside)
        self.view?.loginButton.addTarget(self, action: #selector(didTapOnloginButton), for: .touchUpInside)
    }
    
    @objc private func didTapOnSignupButton() {
        let vc = view as? UIViewController
        vc?.presentVC(storyBoard: AppConstant.storybardName, identifier: AppConstant.signupVCIdentifier)
    }
    
    @objc private func didTapOnloginButton() {
        self.delegate?.checkUser()
    }
    
}

extension LoginUIController: LoginDetailsFetched {
    func success() {
        let vc = view as? UIViewController
        (self.view as? UIViewController)?.showToast(message: AppConstant.loginSuccessToastMsg)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            vc?.presentVC(storyBoard: AppConstant.storybardName, identifier: AppConstant.dashboardVCIdentifier)
        }
    }
    func error() {
        (self.view as? UIViewController)?.showAlert(title: AppConstant.alert, message: AppConstant.noUserErrorMsg, comletion: nil)
    }
}
