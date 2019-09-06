![Screenshot](screenshot.gif)

[![CI Status](https://img.shields.io/travis/michaelhenry/AutoBot.svg?style=flat)](https://travis-ci.org/michaelhenry/AutoBot)
[![Version](https://img.shields.io/cocoapods/v/AutoBot.svg?style=flat)](https://cocoapods.org/pods/AutoBot)
[![License](https://img.shields.io/cocoapods/l/AutoBot.svg?style=flat)](https://cocoapods.org/pods/AutoBot)
[![Platform](https://img.shields.io/cocoapods/p/AutoBot.svg?style=flat)](https://cocoapods.org/pods/AutoBot)

# AUTOBOT

A Tool for Tester and Developer.

Tester should create test cases from Admin page

While Developer should execute the test cases from server via API automatically.

## Draft IOS Test Cases

In the screenshot above, the code was executed like this, so imagine, this is `Codable`, we can just fetch this from any server and/or any file.

```swift
class AutoBotUITests: XCTestCase {

  let app = XCUIApplication()

  override func setUp() {
    continueAfterFailure = false
    app.launch()
    XCUIDevice.shared.orientation = .portrait
  }

  func testLogin() {
    let loginActions:[Action] = [
      Action(control: .text("emailField"), actionType: .tap),
      Action(control: .text("emailField"), actionType: .typeText("me@iamkel.net")),
      Action(control: .text("passwordField"), actionType: .tap),
      Action(control: .text("passwordField"), actionType: .typeText("supersecret")),
      Action(control: .button("loginButton"), actionType: .tap),
    ]

    let autobot = AutoBot(app: app, actions: loginActions)
    autobot.execute()
  }
}
```

> Since Android has own UITesting, this can be also implemented Automatically in Android SOON!

## Installation

AutoBot is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AutoBot'
```

## Author

michaelhenry, me@iamkel.net

## License

AutoBot is available under the MIT license. See the LICENSE file for more info.


## Other tools that I made that might help you.

- [Localizr](https://github.com/michaelhenry/Localizr), Automates your **localization files** for `iOS` and `Android`
- [Hijackr](https://github.com/michaelhenry/Hijackr), Mock your `URLRequest`

