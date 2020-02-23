//
//  SignInContract.swift
//  Authorization
//
//  Created by Oleg Sinev on 23/02/2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

// MARK: - Builder
protocol SignInBuilderProtocol: class {
	static func build() -> SignInViewController
}

// MARK: - View
protocol SignInViewInput: class {}
protocol SignInViewOutput {}

// MARK: - Interactor
protocol SignInInteractorInput {}
protocol SignInInteractorOutput: class {}
