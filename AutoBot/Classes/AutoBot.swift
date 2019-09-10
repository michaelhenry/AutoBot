//
//  AutoBot.swift
//  AutoBotUITests
//
//  Created by Michael Henry Pantaleon on 2019/09/06.
//  Copyright © 2019 Michael Henry Pantaleon. All rights reserved.
//
import XCTest

public class AutoBot {
  
  unowned var app:XCUIApplication!
  
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
      case .expect(let property, let control):
        let element = control.element(from: _self.app)
        
        guard _self.assertWait(element, predicate: property.predicate)
          else { fatalError("\(control.identifier) is unexpected!") }
        
//        switch property {
//        case .isEnabled(let value):
//          XCTAssertEqual(
//            control.element(from: _self.app).isEnabled,
//            value,
//            "isEnabled must be \(value) for \(control.identifier)")
//        case .isExists(let value):
//          XCTAssertEqual(
//            control.element(from: _self.app).exists,
//            value,
//            "isExists must be \(value) for \(control.identifier)")
//        case .title(let value):
//          XCTAssertEqual(
//            control.element(from: _self.app).title,
//            value,
//            "title must be \(value) for \(control.identifier)")
//        case .textValue(let value):
//          XCTAssertEqual(
//            control.element(from: _self.app).value as? String,
//            value,
//            "text must be \(value) for \(control.identifier)")
//        }
      case .takeScreenshot:
        _self.takeScreenshot()
      }
    }
  }
  
  func assertWait(_ element:XCUIElement, predicate:NSPredicate, timeout:TimeInterval = 2) -> Bool {
    let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
    let result:XCTWaiter.Result = XCTWaiter().wait(for: [expectation], timeout: timeout)
    return result == .completed
  }
  
  func takeScreenshot() {
    _ = XCUIScreen.main.screenshot()
  }
}
