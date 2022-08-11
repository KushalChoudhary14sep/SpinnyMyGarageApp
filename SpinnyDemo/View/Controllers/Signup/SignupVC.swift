//
//  SignupVC.swift
//  SpinnyDemo
//
//  Created by Kushal Choudhary on 09/08/22.
//

import Foundation
import UIKit

protocol SignupView: AnyObject {
    var usernameTextField: TextField! { get set }
    var passwordTextField: TextField! { get set }
    var signupButton: UIButton! { get set }
    var loginButton: UIButton! { get set }
}

class SignupViewController: UIViewController, SignupView {
    @IBOutlet weak var usernameTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    private var signupUIController: SignupUIController?
    private var signupViewModel: SignupViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signupUIController = SignupUIController()
        self.signupUIController?.view = self
        self.signupViewModel = SignupViewModel()
        self.signupViewModel?.view = self
        self.signupUIController?.delegate = signupViewModel
        self.signupViewModel?.delegate = signupUIController
        self.usernameTextField.addTarget(self, action: #selector(setUserNameInViewModel(textField:)), for: .editingChanged)
        self.passwordTextField.addTarget(self, action: #selector(setPasswordInViewModel(textField:)), for: .editingChanged)
    }

    @objc func setPasswordInViewModel(textField: UITextField) {
        self.signupViewModel?.password = textField.text
    }
    @objc func setUserNameInViewModel(textField: UITextField) {
        self.signupViewModel?.userName = textField.text
    }
}
