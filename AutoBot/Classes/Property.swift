//
//  Property.swift
//  AutoBot
//
//  Created by Michael Henry Pantaleon on 2019/09/06.
//
import Foundation

public enum Property:CustomStringConvertible {
  
  case isEnabled(Bool)
  case isExists(Bool)
  case title(String)
  case textValue(String)

  public var description: String {
    switch self {
    case .isExists:
      return "isExist"
    case .isEnabled:
      return "isEnabled"
    case .title:
      return "title"
    case .textValue:
      return "textValue"
    }
  }
  
  func propertyName(for control:Control) -> String {
    switch self {
    case .isExists:
      return "exists"
    case .isEnabled:
      return "isEnabled"
    case .textValue:
      return "value"
    case .title:
      switch control {
      case .navigationBar:
        return "identifier"
      default:
        return "title"
      }
    }
  }
  
  func predicate(for control:Control) -> NSPredicate {
    let propName = propertyName(for: control)
    switch self {
    case .isExists(let value):
      return NSPredicate(format: "\(propName) == \(value)")
    case .isEnabled(let value):
      return NSPredicate(format: "\(propName) == \(value)")
    case .textValue(let value):
       return NSPredicate(format: "\(propName) == %@", value)
    case .title(let value):
      switch control {
      case .navigationBar:
        return NSPredicate(format: "\(propName) == %@", value)
      default:
        return NSPredicate(format: "\(propName) == %@", value)
      }
    }
  }
}
