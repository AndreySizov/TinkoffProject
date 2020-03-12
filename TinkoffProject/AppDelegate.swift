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
import Stocks


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//       deprecated in release 2.0.2., checkout release 1.0.1 for Authorization perfomance
//        let vc = AuthorizationModule.createAuthorizationFlow()
        
        let vc = Stocks.ViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }

}

