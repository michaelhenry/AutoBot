//
//  Command.swift
//  AutoBot
//
//  Created by Michael Henry Pantaleon on 2019/09/06.
//

public enum Command {
  case action(Action, for: Control)
  case expect(Property, for: Control)
  case takeScreenshot
}
