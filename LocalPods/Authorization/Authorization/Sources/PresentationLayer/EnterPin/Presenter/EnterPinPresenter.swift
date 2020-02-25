//
//  EnterPinPresenter.swift
//  Authorization
//
//  Created by Oleg Sinev on 24/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

class EnterPinPresenter {

    // MARK: - Protocol properties
    weak var view: EnterPinViewInput?
    private let interactor: EnterPinInteractorInput
    private let router: EnterPinRouterInput

    // MARK: - Properties
    private var pinCode = String() {
        didSet {
            updateState()
        }
    }
    private var confirmPinCode = String() {
        didSet {
            updateState()
        }
    }

    // MARK: - Init
    init(interactor: EnterPinInteractorInput, router: EnterPinRouterInput) {
        self.interactor = interactor
        self.router = router
    }

    private func updateState() {
        view?.setButtonEnabled(to: pinCode == confirmPinCode && !pinCode.isEmpty && !confirmPinCode.isEmpty)
    }

}

// MARK: - EnterPinViewOutput
extension EnterPinPresenter: EnterPinViewOutput {

    func didChangePinCode(with string: String?) {
        guard let string = string else {
            return
        }
        pinCode = string
    }

    func didChangeConfirmPinCode(with string: String?) {
        guard let string = string else {
            return
        }
        confirmPinCode = string
    }

    func didTapContinueButton() {
        interactor.savePin(with: pinCode)
    }

}

// MARK: - EnterPinInteractorOutput
extension EnterPinPresenter: EnterPinInteractorOutput {

    func pinSaved() {
        router.navigateToBlankScreen()
    }

}
