//
//  Property.swift
//  AutoBot
//
//  Created by Michael Henry Pantaleon on 2019/09/06.
//

public enum Property {
  
  case isEnabled(Bool)
  case isExists(Bool)
  case title(String)
  case textValue(String)
  case navBarIdentifier(String)
  
  var predicate:NSPredicate {
    switch self {
    case .isExists(let value):
      return NSPredicate(format: "exists == \(value)")
    case .isEnabled(let value):
      return NSPredicate(format: "isEnabled == \(value)")
    case .textValue(let value):
       return NSPredicate(format: "value == %@", value)
    case .title(let value):
      return NSPredicate(format: "title == \(value)")
    case .navBarIdentifier(let identifier):
      return NSPredicate(format: "identifier == %@", identifier)
    }
  }
}
