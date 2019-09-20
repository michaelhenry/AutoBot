//
//  Command.swift
//  AutoBot
//
//  Created by Michael Henry Pantaleon on 2019/09/06.
//
import Foundation

public enum Command {
  case action(Action, for: Control)
  case expect(Property, for: Control)
  case expectWithin(TimeInterval, Property, for: Control)
  case takeScreenshot(String)
}
