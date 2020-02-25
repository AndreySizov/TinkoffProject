//
//  AppDelegate.swift
//  TinkoffProject
//
//  Created by Андрей on 20/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

import UIKit
import CoreData
import Authorization


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = AuthorizationModule.createAuthorizationFlow()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }

}

