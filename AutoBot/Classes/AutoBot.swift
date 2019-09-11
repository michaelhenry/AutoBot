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
      case .expect(let property, let control, let within):
        _self.assertWait(control, property: property, timeout: within)
      case .takeScreenshot:
        _self.takeScreenshot()
      }
    }
  }
  
  func assertWait(_ control:Control, property:Property, timeout:TimeInterval = 2) {
    let element = control.element(from: app)
    let predicate = property.predicate(for: control)
    let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
    let result:XCTWaiter.Result = XCTWaiter().wait(for: [expectation], timeout: timeout)
    switch result {
    case .interrupted:
      XCTFail("Expectation for \(control.identifier).\(property) is iterrupted.")
    case .timedOut:
      XCTFail("Expectation for \(control.identifier).\(property) timedOut.")
    case .invertedFulfillment:
      XCTFail("Expectation for \(control.identifier).\(property) invertedFulfillment.")
    case .incorrectOrder:
      XCTFail("Expectation for \(control.identifier).\(property) incorrectOrder.")
    case .completed:
      break
    default:
      XCTFail("Assertion Failed for \(control.identifier).\(property).")
    }

  }
  
  func takeScreenshot() {
    _ = XCUIScreen.main.screenshot()
  }
}
