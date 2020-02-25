//

//  CheckPinRouter.swift
//  Authorization
//
//  Created by Oleg Sinev on 24/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

import UIKit

final class CheckPinRouter {

    weak var viewController: UIViewController?

}

extension CheckPinRouter: CheckPinRouterInput {

    func navigateToBlankScreen() {
        let blankVC = UIViewController()
        viewController?.navigationController?.pushViewController(blankVC, animated: true)
    }

    func showErrorAlert() {
        let alert = UIAlertController(title: "Ошибка!", message: "Пин не совпадает, попробуйте еще раз", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }

}
