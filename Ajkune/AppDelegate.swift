//
//  AppDelegate.swift
//  BaseProject
//
//  Created by Djellza Rrustemi
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: TDAppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        IQKeyboardManager.shared.enable = true
        self.start(window)
        return true
    }
    
    func start(_ window: UIWindow?){
        appCoordinator = TDAppCoordinator(window: window!)
        appCoordinator.start()
        window?.makeKeyAndVisible()
    }
}

