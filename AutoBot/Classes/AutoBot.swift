//
//  AutoBot.swift
//  AutoBotUITests
//
//  Created by Michael Henry Pantaleon on 2019/09/06.
//  Copyright © 2019 Michael Henry Pantaleon. All rights reserved.
//
import XCTest

public class AutoBot {
  
  let app:XCUIApplication!
  
  public init(app:XCUIApplication) {
    self.app = app
  }
  
  public func execute(commands: [Command]) {
    commands.forEach { [weak self] command in
      guard let _self = self else { return }
  
      switch command  {
      case .action(let action, let control):
        switch action {
        case .tap:
          control.element(from: _self.app).tap()
        case .typeText(let text):
          control.element(from: _self.app).typeText(text)
        }
      case .assert(let property, let control):
        switch property {
        case .isEnabled(let value):
          XCTAssertEqual(
            control.element(from: _self.app).isEnabled,
            value,
            "isEnabled must be \(value) for \(control.identifier)")
        case .isExists(let value):
          XCTAssertEqual(
            control.element(from: _self.app).exists,
            value,
            "isExists must be \(value) for \(control.identifier)")
        case .title(let value):
          XCTAssertEqual(
            control.element(from: _self.app).title,
            value,
            "title must be \(value) for \(control.identifier)")
        case .textValue(let value):
          XCTAssertEqual(
            control.element(from: _self.app).value as? String,
            value,
            "text must be \(value) for \(control.identifier)")
        }
      }
    }
  }
}
