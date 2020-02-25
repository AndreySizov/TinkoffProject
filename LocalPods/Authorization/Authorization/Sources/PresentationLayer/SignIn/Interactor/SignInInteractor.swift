//
//  SignInInteractor.swift
//  Authorization
//
//  Created by Oleg Sinev on 23/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

class SignInInteractor {

    // MARK: - Protocol properties
    weak var output: SignInInteractorOutput?

}

// MARK: - SignInInteractorInput
extension SignInInteractor: SignInInteractorInput {}
