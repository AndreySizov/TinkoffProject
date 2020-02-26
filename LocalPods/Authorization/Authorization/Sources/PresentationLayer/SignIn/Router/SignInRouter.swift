//

//  SignInRouter.swift
//  Authorization
//
//  Created by Oleg Sinev on 23/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

import UIKit

final class SignInRouter {

    weak var viewController: UIViewController?
}

extension SignInRouter: SignInRouterInput {

    func navigateToBlankScreen() {
        let vc = UIViewController()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }

    func navigateToEnterPin() {
        let enterPinVC = EnterPinBuilder.build()
        viewController?.navigationController?.pushViewController(enterPinVC, animated: true)
    }
    
}
