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
  
  func testLogin() {
    let loginCommands:[Command] = [
      .action(.tap, for: .text("emailField")),
      .action(.typeText("me@iamkel.net"), for: .text("emailField")),
      .assert(.isEnabled(true), for: .text("emailField")),
      .assert(.isExists(true), for: .text("emailField")),
      .assert(.textValue("me@iamkel.net"), for: .text("emailField")),
      .action(.tap, for: .securedText("passwordField")),
      .action(.typeText("supersecret"), for: .securedText("passwordField")),
      .assert(.textValue("•••••••••••"), for: .securedText("passwordField")),
      .action(.tap, for: .button("loginButton")),
    ]
    autobot.execute(commands: loginCommands)
  }
}
