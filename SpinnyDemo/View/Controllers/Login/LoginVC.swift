//
//  ViewController.swift
//  SpinnyDemo
//
//  Created by Kushal Choudhary on 09/08/22.
//

import Foundation
import UIKit

protocol LoginView: AnyObject {
    var usernameTextField: TextField! { get set }
    var passwordTextField: TextField! { get set }
    var signupButton: UIButton! { get set }
    var loginButton: UIButton! { get set }
}

class LoginViewController: UIViewController, LoginView {
    @IBOutlet weak var usernameTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    private var loginUIController: LoginUIController?
    private var loginViewModel: LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginUIController = LoginUIController()
        self.loginUIController?.view = self
        self.loginViewModel = LoginViewModel()
        self.loginViewModel?.view = self
        self.loginUIController?.delegate = loginViewModel
        self.loginViewModel?.delegate = loginUIController
    }

}

