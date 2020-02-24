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
    let interactor: SignInInteractorInput

    // MARK: - Init
    init(interactor: SignInInteractorInput) {
        self.interactor = interactor
    }

}

// MARK: - SignInViewOutput
extension SignInPresenter: SignInViewOutput {}

// MARK: - SignInInteractorOutput
extension SignInPresenter: SignInInteractorOutput {}
