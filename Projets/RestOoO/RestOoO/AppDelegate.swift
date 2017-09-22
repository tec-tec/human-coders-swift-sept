//
//  AppDelegate.swift
//  RestOoO
//
//  Created by Ludovic Ollagnier on 19/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    class Human {
        weak var father: Human?
        var child: Human?
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let h1 = Human()
        let h2 = Human()
        h1.child = h2
        h2.father = h1


//        UILabel.appearance(for: UITraitCollection(verticalSizeClass: .compact)).backgroundColor = UIColor.green
//        UILabel.appearance(for: UITraitCollection(verticalSizeClass: .regular)).backgroundColor = UIColor.clear

        let prefs = UserDefaults.standard
//        prefs.set(true, forKey: "moi")

        let b = prefs.bool(forKey: "moi")
        print(b)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

        let dir = Directory.demoDirectory()

        guard let jsonData = try? JSONEncoder().encode(dir) else { return }
        guard let jsonString = String(data: jsonData, encoding: .utf8) else { return }
        print(jsonString)

        guard let dir2 = try? JSONDecoder().decode(Directory.self, from: jsonData) else { return }
        print(dir2)

        let pliencoder = PropertyListEncoder()
        pliencoder.outputFormat = .xml

        guard let plistData = try? pliencoder.encode(dir) else { return }
        guard let xmlString = String(data: plistData, encoding: .utf8) else { return }
        print(xmlString)
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

