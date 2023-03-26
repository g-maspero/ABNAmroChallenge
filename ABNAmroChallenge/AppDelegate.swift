//
//  AppDelegate.swift
//  ABNAmroChallenge
//
//  Created by angst on 26/03/2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = ViewController()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        self.window = window
            
        return true
    }
}
