//
//  AppDelegate.swift
//  LoginDemo
//
//  Created by AnhNguyen on 31/12/2022.
//

import UIKit
import LoginFramework
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // Sample Custom SimpleLayout
        let simpleLayout = SimpleLayout()
        simpleLayout.primaryColor = UIColor(red: 56/255.0, green: 112/255.0, blue: 58/255.0, alpha: 1.0)
        
        // Sample Custom AdvancedLayout
        let advancedLayout = AdvancedLayout()
        advancedLayout.linePassword.color = .green
        advancedLayout.lineUsername.color = .green
        advancedLayout.tfUsername.textColor = .blue
        advancedLayout.tfPassword.textColor = .blue
        advancedLayout.buttonForgot.fontColor = .blue
        
        let signinViewController = SigninViewController()
        //signinViewController.layout = .Simple(layout: simpleLayout)
        //signinViewController.layout = .Advanced(layout: advancedLayout)
        
        // Sample load SwiftUI
        //let signinViewController = UIHostingController(rootView: SigninViewControllerSwiftUI())
        
        window?.rootViewController = signinViewController
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

