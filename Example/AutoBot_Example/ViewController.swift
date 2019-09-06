//
//  ViewController.swift
//  AutoBot_Example
//
//  Created by Michael Henry Pantaleon on 2019/09/06.
//  Copyright © 2019 Michael Henry Pantaleon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var emailField:UITextField!
  @IBOutlet weak var passwordField:UITextField!
  @IBOutlet weak var loginButton:UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    emailField.accessibilityIdentifier = "emailField"
    passwordField.accessibilityIdentifier = "passwordField"
    passwordField.isSecureTextEntry = true
    loginButton.accessibilityIdentifier = "loginButton"
    
    loginButton.addTarget(
      self, action: #selector(didTapLogin(_:)),
      for: .touchUpInside)
  }
  
  @objc func didTapLogin(_ sender: UIButton) {
    let alert = UIAlertController(title: "App", message: "Login successful!", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}

