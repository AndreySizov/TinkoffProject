//
//  EnterPinInteractor.swift
//  Authorization
//
//  Created by Oleg Sinev on 24/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

class EnterPinInteractor {

    // MARK: - Protocol properties
    weak var output: EnterPinInteractorOutput?

}

// MARK: - EnterPinInteractorInput
extension EnterPinInteractor: EnterPinInteractorInput {}
