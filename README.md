# swift_login_framework

## Requirements

Create a reusable log in framework:
- Login details can be stubbed.
- UI should be customizable.

## Features
- Programming language: Swift 
- Design app's architecture: MVP Pattern
- Protocol-Oriented Programming
- Unit test: Test-Driven Development
- Customize UI: SimpleLayout & AdvancedLayout
- Support layout for all devices iPhone & iPad
- Network: URLSession, easy to replace with other third-party
- Observe Keyboard when user input
- Validator data input
- Error handling
- Continuous Integration: Github Actions <br />
[![iOS starter workflow](https://github.com/oliver-anh-nguyen/swift_clean_mvvm_base/actions/workflows/ios.yml/badge.svg)](https://github.com/oliver-anh-nguyen/swift_clean_mvvm_base/actions/workflows/ios.yml)

## Installation

To compile/run/test the LoginFramework:

- Open the Xcode Workspace Login.xcworkspace
- Select the LoginFramework scheme
- Run by pressing Play or by pressing [Cmd + R]

To compile/run the Demo iOS application using Framework:
- Open LoginFramework.xcodeproj
- Select the LoginDemo scheme
- Run by pressing Play or by pressing [Cmd + R]

## Usage example

1. Import the LoginFramework in your AppDelegate
```swift
import LoginFramework
```
2. In didFinishLaunchingWithOptions in your AppDelegate
- To show default UI Signin
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.main.bounds)
    let signinViewController = SigninViewController()
    window?.rootViewController = signinViewController
    window?.makeKeyAndVisible()
    return true
}
```
- To customize layout, we have two types of layout configuration: SimpleLayout & AdvancedLayout
```swift
let simpleLayout = SimpleLayout()
simpleLayout.primaryColor = UIColor(red: 56/255.0, green: 112/255.0, blue: 58/255.0, alpha: 1.0)
simpleLayout.backgroundColor = .red
simpleLayout.logoImage = UIImage(named: "logo.png")
simpleLayout.backgroundImage = UIImage(named: "background.png")
let signinViewController = SigninViewController()
signinViewController.layout = .Simple(layout: simpleLayout)
```
```swift
let advancedLayout = AdvancedLayout()
advancedLayout.linePassword.color = .green
advancedLayout.lineUsername.color = .green
advancedLayout.tfUsername.textColor = .blue
advancedLayout.tfPassword.textColor = .blue
advancedLayout.buttonForgot.fontColor = .blue
advancedLayout.imgLogo.image = UIImage(named: "logo.png")
advancedLayout.textSignin.font = UIFont.systemFont(ofSize: 17)
let signinViewController = SigninViewController()
signinViewController.layout = .Advanced(layout: advancedLayout)
```
