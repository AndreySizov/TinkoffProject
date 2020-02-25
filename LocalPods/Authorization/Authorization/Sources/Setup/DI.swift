//
//  DI.swift
//  Authorization_Example
//
//  Created by Oleg on 24.02.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Dip

final class DIContainer {

    // MARK: - Properties
    static let instance = DependencyContainer {
        unowned let container = $0

        container.register {
            AuthorizationService() as IAuthorizationService
        }

    }

    static var authService: IAuthorizationService {
        guard let authService = try? instance.resolve() as IAuthorizationService else {
            fatalError()
        }
        return authService
    }

}
