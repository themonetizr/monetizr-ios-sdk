//
//  AppDelegate.swift
//  Monetizr-v3
//
//  Created by Armands Avotins on 13/04/2019.
//  Copyright © 2019 Monetizr. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Init Monetizr with token
        Monetizr.shared.token = "4D2E54389EB489966658DDD83E2D1" // set token
        // Monetizr.shared.setTheme(theme: .black) // Optional - .system will be used by default
        Monetizr.shared.setApplePayMerchantID(id: "merchant.com.monetizr.sdk") // Optional, needed to setup Apple Pay
        Monetizr.shared.setCompanyName(companyName: "Monetizing Solutions") // Optional to override default value - App name
        // Setup mode
        Monetizr.shared.testMode(enabled: true) // Optional - default false
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

