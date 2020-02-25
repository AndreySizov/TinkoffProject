//
//  EnterPinContract.swift
//  Authorization
//
//  Created by Oleg Sinev on 24/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

// MARK: - Builder
protocol EnterPinBuilderProtocol: class {
	static func build() -> EnterPinViewController
}

// MARK: - View
protocol EnterPinViewInput: class {
    func setButtonEnabled(to isEnabled: Bool)
}
protocol EnterPinViewOutput {
    func didChangePinCode(with string: String?)
    func didChangeConfirmPinCode(with string: String?)
    func didTapContinueButton()
}

// MARK: - Interactor
protocol EnterPinInteractorInput {
    func savePin(with text: String)
}
protocol EnterPinInteractorOutput: class {
    func pinSaved()
}
