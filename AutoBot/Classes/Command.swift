//
//  Command.swift
//  AutoBot
//
//  Created by Michael Henry Pantaleon on 2019/09/06.
//

public enum Command {
  case action(Action, for: Control)
  case assert(Property, for: Control)
}
