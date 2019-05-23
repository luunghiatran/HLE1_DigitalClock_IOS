//
//  AppDelegate.swift
//  NghiaDigitalClock
//
//  Created by TrungNguyen on 5/14/19.
//  Copyright © 2019 BTS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        configApplicationTheme()
        
        // === Show View Controller ===
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        //let navigation = UINavigationController(rootViewController: homeController)
        //window?.rootViewController = navigation
        window?.rootViewController = homeController
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

    func configApplicationTheme() {
        // Background
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().barTintColor = UIColor.darkGray
        // Icon
        UINavigationBar.appearance().tintColor = UIColor.white
        
        // Title
        let navTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        UINavigationBar.appearance().titleTextAttributes = navTitleTextAttributes
        UISearchBar.appearance().barTintColor = UIColor.red
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.purple], for: .normal)
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.yellow], for: .selected)
    }
}
