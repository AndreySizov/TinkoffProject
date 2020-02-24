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
    let interactor: EnterPinInteractorInput

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
    init(interactor: EnterPinInteractorInput) {
        self.interactor = interactor
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
        
    }

}

// MARK: - EnterPinInteractorOutput
extension EnterPinPresenter: EnterPinInteractorOutput {}
