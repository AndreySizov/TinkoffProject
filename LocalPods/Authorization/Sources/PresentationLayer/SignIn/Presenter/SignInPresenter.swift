//
//  SignInPresenter.swift
//  Authorization
//
//  Created by Oleg Sinev on 23/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

class SignInPresenter {

    // MARK: - Protocol properties
    weak var view: SignInViewInput?
    private let interactor: SignInInteractorInput
    private let router: SignInRouterInput

    // MARK: - Properties
    private var shouldMoveToEnterPin = false
    private var password = String() {
        didSet {
            updateState()
        }
    }
    private var login = String(){
        didSet {
            updateState()
        }
    }

    // MARK: - Init
    init(interactor: SignInInteractorInput, router: SignInRouterInput) {
        self.interactor = interactor
        self.router = router
    }

    private func updateState() {
        view?.setButtonAvailability(to: login.latinCharactersOnly && login.count > 2 && password.count > 7 && password.count <= 20)
    }

}

// MARK: - SignInViewOutput
extension SignInPresenter: SignInViewOutput {

    func didTapCheckButton(isSelected: Bool) {
        shouldMoveToEnterPin = isSelected
    }

    func didTapContinueButton() {
        if shouldMoveToEnterPin {
            router.navigateToEnterPin()
        } else {
            router.navigateToBlankScreen()
        }
    }

    func didEnterPassword(_ text: String?) {
        guard let text = text else {
            return
        }
        password = text
    }

    func didEnterLogin(_ text: String?) {
        guard let text = text else {
            return
        }
        login = text
    }
}

// MARK: - SignInInteractorOutput
extension SignInPresenter: SignInInteractorOutput {}

private extension String {

    var latinCharactersOnly: Bool {
        return self.range(of: "\\P{Latin}", options: .regularExpression) == nil
    }

}
