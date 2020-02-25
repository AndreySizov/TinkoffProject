//
//  Authorization.swift
//  Authorization_Example
//
//  Created by Oleg on 24.02.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Dip

public class AuthorizationModule {

    // MARK: - Properties
    private static var service = DIContainer.authService

    static public func createAuthorizationFlow() -> UINavigationController {
        let rootViewController: UIViewController
        if service.isPinCodeSet() {
            rootViewController = EnterPinBuilder.build()
        } else {
            rootViewController = SignInBuilder.build()
        }
        return UINavigationController(rootViewController: rootViewController)
    }

}
