//
//  SigninLayout.swift
//  LoginFramework
//
//  Created by AnhNguyen on 31/12/2022.
//

import UIKit

public struct MainConfig {
    public var backgroundColor:UIColor?
    public var alpha:Float?
    public var image:UIImage?
}

public struct LogoConfig {
    public var backgroundColor:UIColor?
    public var alpha:Float?
    public var image:UIImage?
}

public struct TextConfig {
    public var textSize:Float?
    public var font:UIFont?
    public var fontColor:UIColor?
}

public struct IconConfig {
    public var image:UIImage?
}

public struct TextfieldConfig {
    public var font:UIFont?
    public var textColor:UIColor?
}

public struct LineConfig {
    public var color:UIColor?
    public var alpha:Float?
}

public struct ButtonConfig {
    public var backgroundColor:UIColor?
    public var font:UIFont?
    public var alpha:Float?
    public var fontColor:UIColor?
    public var cornerRadius:Float?
}

public enum Layout {
    case Simple(layout:SimpleLayout)
    case Advanced(layout:AdvancedLayout)
}

public protocol SigninLayout {
    
}

public class AdvancedLayout:SigninLayout {
    public var tfUsername = TextfieldConfig()
    public var tfPassword = TextfieldConfig()
    public var iconUsername = IconConfig()
    public var iconPassword = IconConfig()
    public var lineUsername = LineConfig()
    public var linePassword = LineConfig()
    public var buttonSignin = ButtonConfig()
    public var buttonForgot = ButtonConfig()
    public var imgLogo = LogoConfig()
    public var mainView = MainConfig()
    public var textSignin = TextConfig()
    
    public init() {}
}

public class SimpleLayout:SigninLayout {
    public var primaryColor:UIColor?
    public var backgroundColor:UIColor?
    
    public var backgroundImage:UIImage?
    public var logoImage:UIImage?
    
    public init() {}
}

