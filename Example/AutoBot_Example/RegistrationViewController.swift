//
//  RegistrationViewController.swift
//  AutoBot_Example
//
//  Created by Michael Henry Pantaleon on 2019/09/10.
//  Copyright © 2019 Michael Henry Pantaleon. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
  
  @IBOutlet weak var emailField:UITextField!
  @IBOutlet weak var passwordField:UITextField!
  @IBOutlet weak var confirmPasswordField:UITextField!
  @IBOutlet weak var registerButton:UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    emailField.accessibilityIdentifier = "emailField"
    passwordField.accessibilityIdentifier = "passwordField"
    passwordField.isSecureTextEntry = true
    confirmPasswordField.accessibilityIdentifier = "confirmPasswordField"
    confirmPasswordField.isSecureTextEntry = true
    registerButton.accessibilityIdentifier = "registerButton"
    
    registerButton.addTarget(
      self, action: #selector(didTapRegister(_:)),
      for: .touchUpInside)
  }
  
  @objc func didTapRegister(_ sender: UIButton) {
    guard let dashboardVC = storyboard?.instantiateViewController(withIdentifier: "DashboardViewController")
      else { fatalError("no dashboard vc")}
    navigationController?.setViewControllers([dashboardVC], animated: true)
  }
}

