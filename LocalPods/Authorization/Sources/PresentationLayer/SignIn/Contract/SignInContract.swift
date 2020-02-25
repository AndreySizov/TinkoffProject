//
//  SignInContract.swift
//  Authorization
//
//  Created by Oleg Sinev on 23/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

// MARK: - Builder
protocol SignInBuilderProtocol: class {
	static func build() -> SignInViewController
}

// MARK: - View
protocol SignInViewInput: class {
     func setButtonAvailability(to isEnabled: Bool)
}
protocol SignInViewOutput {
    func didTapCheckButton(isSelected: Bool)
    func didTapContinueButton()
    func didEnterPassword(_ text: String?)
    func didEnterLogin(_ text: String?)
}

// MARK: - Interactor
protocol SignInInteractorInput {}
protocol SignInInteractorOutput: class {}

// MARK: - Router
protocol SignInRouterInput {
    func navigateToEnterPin()
    func navigateToBlankScreen()
}
