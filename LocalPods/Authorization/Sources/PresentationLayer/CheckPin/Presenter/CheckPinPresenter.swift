//
//  CheckPinPresenter.swift
//  Authorization
//
//  Created by Oleg Sinev on 24/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

class CheckPinPresenter {

    // MARK: - Protocol properties
    weak var view: CheckPinViewInput?
    private let interactor: CheckPinInteractorInput
    private let router: CheckPinRouterInput

    // MARK: - Properties
    private var pinCode = String() {
        didSet {
            updateState()
        }
    }

    // MARK: - Init
    init(interactor: CheckPinInteractorInput, router: CheckPinRouterInput) {
        self.interactor = interactor
        self.router = router
    }

    private func updateState() {
        view?.setButtonEnabled(to: !pinCode.isEmpty)
    }
}

// MARK: - CheckPinViewOutput
extension CheckPinPresenter: CheckPinViewOutput {

    func didTapContinueButton() {
        interactor.checkPin(pinCode)
    }

    func didChangePinCode(with string: String?) {
        guard let string = string else {
            return
        }
        pinCode = string
    }

}

// MARK: - CheckPinInteractorOutput
extension CheckPinPresenter: CheckPinInteractorOutput {

    func pinCheckSuccessed() {
        print("!! success")
        router.navigateToBlankScreen()
    }

    func pinCheckFailure() {
        print("!! error")
        router.showErrorAlert()
    }

}
