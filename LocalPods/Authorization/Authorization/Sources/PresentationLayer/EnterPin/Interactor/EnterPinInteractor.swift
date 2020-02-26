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
    private let service: IAuthorizationService

    init(with service: IAuthorizationService) {
        self.service = service
    }

}

// MARK: - EnterPinInteractorInput
extension EnterPinInteractor: EnterPinInteractorInput {

    func savePin(with text: String) {
        service.set(pinCode: text, completion: { [unowned self] _ in
            self.output?.pinSaved()
        })
    }

}
