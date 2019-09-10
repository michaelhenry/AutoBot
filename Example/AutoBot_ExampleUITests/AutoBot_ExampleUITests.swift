//
//  AutoBot_ExampleUITests.swift
//  AutoBot_ExampleUITests
//
//  Created by Michael Henry Pantaleon on 2019/09/06.
//  Copyright © 2019 Michael Henry Pantaleon. All rights reserved.
//

import XCTest
import AutoBot
import XCTest

class AutoBotUITests: XCTestCase {
  
  let app = XCUIApplication()
  var autobot:AutoBot!
  
  override func setUp() {
    continueAfterFailure = false
    app.launch()
    XCUIDevice.shared.orientation = .portrait
    autobot = AutoBot(app: app)
  }
  
  override func tearDown() {
    
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testLoginProcess() {
    let loginCommands:[Command] = [
      .action(.tap, for: .text("emailField")),
      .action(.typeText("me@iamkel.net"), for: .text("emailField")),
      .expect(.isEnabled(true), for: .text("emailField"), within: 2),
      .expect(.isExists(true), for: .text("emailField"), within: 2),
      .expect(.textValue("me@iamkel.net"), for: .text("emailField"), within: 2),
      .action(.tap, for: .securedText("passwordField")),
      .action(.typeText("supersecret"), for: .securedText("passwordField")),
      .expect(.textValue("•••••••••••"), for: .securedText("passwordField"), within: 2),
      .action(.tap, for: .button("loginButton")),
      .expect(.title("Dashboard"), for: .navigationBar, within: 2),
    ]
    autobot.execute(commands: loginCommands)
  }
  
  func testRegistrationProcess() {
    let registrationCommands:[Command] = [
      .action(.tap, for: .button("registerButton")),
      .action(.tap, for: .text("emailField")),
      .action(.typeText("new_account@iamkel.net"), for: .text("emailField")),
      .expect(.isEnabled(true), for: .text("emailField"), within: 2),
      .expect(.isExists(true), for: .text("emailField"), within: 2),
      .expect(.textValue("new_account@iamkel.net"), for: .text("emailField"), within: 2),
      .action(.tap, for: .securedText("passwordField")),
      .action(.typeText("supersecret"), for: .securedText("passwordField")),
      .expect(.textValue("•••••••••••"), for: .securedText("passwordField"), within: 2),
      .action(.tap, for: .securedText("confirmPasswordField")),
      .action(.typeText("supersecret"), for: .securedText("confirmPasswordField")),
      .expect(.textValue("•••••••••••"), for: .securedText("confirmPasswordField"), within: 2),
      .action(.tap, for: .button("registerButton")),
      .expect(.title("Dashboard"), for: .navigationBar, within: 2),
    ]
    autobot.execute(commands: registrationCommands)
  }
}
