//
//  EnterPinContract.swift
//  Authorization
//
//  Created by Oleg Sinev on 24/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

// MARK: - Builder
protocol EnterPinBuilderProtocol: class {
	static func build() -> EnterPinViewController
}

// MARK: - View
protocol EnterPinViewInput: class {}
protocol EnterPinViewOutput {}

// MARK: - Interactor
protocol EnterPinInteractorInput {}
protocol EnterPinInteractorOutput: class {}
