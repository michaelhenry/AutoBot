//
//  Control.swift
//  AutoBot
//
//  Created by Michael Henry Pantaleon on 2019/09/06.
//

import XCTest

public protocol HasIdentifier {
  var identifier:String { get }
}

public enum Control:HasIdentifier {
  case button(String)
  case text(String)
  case securedText(String)
  case navigationBar
  
  public var identifier: String {
    switch self {
    case .button(let x),
         .text(let x),
         .securedText(let x):
      return x
    case .navigationBar:
      return "NavigationBar"
    }
  }
  
  @discardableResult
  func element(from app:XCUIApplication) -> XCUIElement {
    switch self {
    case .button(let identifier):
      return app.buttons.element(matching: .any, identifier: identifier)
    case .text(let identifier):
      return app.textFields.element(matching: .any, identifier: identifier)
    case .securedText(let identifier):
      return app.secureTextFields.element(matching: .any, identifier: identifier)
    case .navigationBar:
      return app.navigationBars.firstMatch
    }
  }
}
