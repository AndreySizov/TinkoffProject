//
//  CheckPinBuilder.swift
//  Authorization
//
//  Created by Oleg Sinev on 24/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

final class CheckPinBuilder: CheckPinBuilderProtocol {

    static func build() -> CheckPinViewController {
        let interactor = CheckPinInteractor(with: DIContainer.authService)
        let router = CheckPinRouter()
        let presenter = CheckPinPresenter(interactor: interactor, router: router)
        let viewController = CheckPinViewController(output: presenter)

        presenter.view = viewController
        router.viewController = viewController
        interactor.output = presenter

        return viewController
    }

}
