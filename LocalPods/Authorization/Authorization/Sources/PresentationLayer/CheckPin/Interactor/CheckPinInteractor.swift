//
//  CheckPinInteractor.swift
//  Authorization
//
//  Created by Oleg Sinev on 24/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

class CheckPinInteractor {

    // MARK: - Protocol properties
    weak var output: CheckPinInteractorOutput?
    private let authService: IAuthorizationService

    init(with service: IAuthorizationService) {
        authService = service
    }

}

// MARK: - CheckPinInteractorInput
extension CheckPinInteractor: CheckPinInteractorInput {

    func checkPin(_ pinCode: String) {
        authService.verify(pinCode: pinCode, completion: {[unowned self] result in
            switch result {
            case .success:
                self.output?.pinCheckSuccessed()
            case .failure:
                self.output?.pinCheckFailure()
            }
        })
    }

}
