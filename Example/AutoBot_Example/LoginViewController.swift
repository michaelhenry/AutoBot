//
//  ViewController.swift
//  AutoBot_Example
//
//  Created by Michael Henry Pantaleon on 2019/09/06.
//  Copyright © 2019 Michael Henry Pantaleon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  @IBOutlet weak var emailField:UITextField!
  @IBOutlet weak var passwordField:UITextField!
  @IBOutlet weak var loginButton:UIButton!
  @IBOutlet weak var registerButton:UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    emailField.accessibilityIdentifier = "emailField"
    passwordField.accessibilityIdentifier = "passwordField"
    passwordField.isSecureTextEntry = true
    loginButton.accessibilityIdentifier = "loginButton"
    registerButton.accessibilityIdentifier = "registerButton"
    
    loginButton.addTarget(
      self, action: #selector(didTapLogin(_:)),
      for: .touchUpInside)
    
    registerButton.addTarget(
      self, action: #selector(didTapRegister(_:)),
      for: .touchUpInside)
  }
  
  @objc func didTapLogin(_ sender: UIButton) {
    guard let dashboardVC = storyboard?.instantiateViewController(withIdentifier: "DashboardViewController")
      else { fatalError("no dashboard vc")}
    navigationController?.setViewControllers([dashboardVC], animated: true)
  }
  
  @objc func didTapRegister(_ sender: UIButton) {
    guard let registerVC = storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController")
      else { fatalError("no register vc")}
    navigationController?.pushViewController(registerVC, animated: true)
  }
}

