//
//  AuthorizationService.swift
//  Authorization
//
//  Created by pro on 23.02.2020.
//

import Foundation
import KeychainAccess

public protocol IAuthorizationService {
    func set(pinCode: String, login: String, password: String, completion: (Result<Void, Error>) -> Void)
    func verify(pinCode: String, completion: (Result<Void, Error>) -> Void)
    func resetPinCode()
}

public class AuthorizationService: IAuthorizationService {
    
    private let pinCodeKey = "PinCodeKey"
    private let loginKey = "LoginKey"
    private let passwordKey = "PasswordKey"
    private let keychain = Keychain()

    public func set(pinCode: String, login: String, password: String, completion: (Result<Void, Error>) -> Void) {
        do {
            try keychain.set(pinCode, key: pinCodeKey)
            try keychain.set(pinCode, key: loginKey)
            try keychain.set(pinCode, key: passwordKey)
            completion(Result.success(()))
        } catch let error {
            completion(Result.failure(error))
        }
    }
    
    public func verify(pinCode: String, completion: (Result<Void, Error>) -> Void) {
        do {
            let savedPinCode = try keychain.get(pinCodeKey)
            
            if pinCode == savedPinCode {
                completion(Result.success(()))
            } else {
                completion(Result.failure(NSError(domain: "", code: 9999, userInfo: nil)))
            }
        } catch let error {
            completion(Result.failure(error))
        }
    }
    
    public func resetPinCode() {
        do {
            try keychain.remove(pinCodeKey)
        } catch {
            print("error: \(error)")
        }
    }

}
