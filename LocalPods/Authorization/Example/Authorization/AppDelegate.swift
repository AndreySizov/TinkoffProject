//
//  AppDelegate.swift
//  Authorization
//
//  Created by kurban.min@mail.ru on 02/22/2020.
//  Copyright (c) 2020 kurban.min@mail.ru. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let rootVC = AuthorizationModule.createAuthorizationFlow()
        window?.rootViewController = rootVC
        return true
    }

}

