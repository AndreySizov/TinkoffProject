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

    // MARK: - Init
    init(interactor: EnterPinInteractorInput) {
        self.interactor = interactor
    }

}

// MARK: - EnterPinViewOutput
extension EnterPinPresenter: EnterPinViewOutput {}

// MARK: - EnterPinInteractorOutput
extension EnterPinPresenter: EnterPinInteractorOutput {}
