//
//  SignInBuilder.swift
//  Authorization
//
//  Created by Oleg Sinev on 23/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

public final class SignInBuilder: SignInBuilderProtocol {

    public static func build() -> SignInViewController {
        let interactor = SignInInteractor()
        let router = SignInRouter()
        let presenter = SignInPresenter(interactor: interactor, router: router)
        let viewController = SignInViewController(output: presenter)

        presenter.view = viewController
        interactor.output = presenter
        router.viewController = viewController

        return viewController
    }

}
