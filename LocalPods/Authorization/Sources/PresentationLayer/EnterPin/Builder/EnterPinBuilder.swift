//
//  EnterPinBuilder.swift
//  Authorization
//
//  Created by Oleg Sinev on 24/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

final class EnterPinBuilder: EnterPinBuilderProtocol {

    static func build() -> EnterPinViewController {
        let interactor = EnterPinInteractor(with: DIContainer.authService)
        let presenter = EnterPinPresenter(interactor: interactor)
        let viewController = EnterPinViewController(output: presenter)

        presenter.view = viewController
        interactor.output = presenter

        return viewController
    }

}
