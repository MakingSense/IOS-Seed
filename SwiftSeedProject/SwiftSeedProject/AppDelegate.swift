//
//  AppDelegate.swift
//  SwiftSeedProject
//
//  Created by Mugu on 3/17/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit
import Dip

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let container = DependencyContainer.configure()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        BuddyBuildSDK.setup()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        let coreDataStack = try! container.resolve() as CoreDataStack
        coreDataStack.saveChanges()
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
        let coreDataStack = try! container.resolve() as CoreDataStack
        coreDataStack.saveChanges()
    }
}

