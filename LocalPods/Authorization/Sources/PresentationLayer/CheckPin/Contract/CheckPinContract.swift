//
//  CheckPinContract.swift
//  Authorization
//
//  Created by Oleg Sinev on 24/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

// MARK: - Builder
protocol CheckPinBuilderProtocol: class {
	static func build() -> CheckPinViewController
}

// MARK: - View
protocol CheckPinViewInput: class {
    func setButtonEnabled(to isEnabled: Bool)
}
protocol CheckPinViewOutput {
    func didTapContinueButton()
    func didChangePinCode(with string: String?)
}

// MARK: - Interactor
protocol CheckPinInteractorInput {
    func checkPin(_ pinCode: String)
}
protocol CheckPinInteractorOutput: class {
    func pinCheckSuccessed()
    func pinCheckFailure()
}

// MARK: - Router
protocol CheckPinRouterInput {
    func navigateToBlankScreen()
    func showErrorAlert()
}
