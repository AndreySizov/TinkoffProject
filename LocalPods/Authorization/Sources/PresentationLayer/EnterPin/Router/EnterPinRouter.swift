//

//  EnterPinRouter.swift
//  Authorization
//
//  Created by Oleg Sinev on 24/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

import UIKit

final class EnterPinRouter {

    weak var viewController: UIViewController?

}

extension EnterPinRouter: EnterPinRouterInput {

    func navigateToBlankScreen() {
        let blankVC = UIViewController()
        viewController?.navigationController?.pushViewController(blankVC, animated: true)
    }

}
