//
//  AuthorizationService.swift
//  Authorization
//
//  Created by pro on 23.02.2020.
//

import Foundation
import KeychainAccess

public class AuthorizationService {
    
    private let pinCodeKey = "PinCodeKey"
    private let keychain = Keychain()
    
    func set(pinCode: String, completion: (Result<Void, Error>) -> Void) {
        do {
            try keychain.set(pinCode, key: pinCodeKey)
            completion(Result.success(()))
        } catch let error {
            completion(Result.failure(error))
        }
    }
    
    func verify(pinCode: String, completion: (Result<Void, Error>) -> Void) {
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
    
    func resetPinCode() {
        do {
            try keychain.remove(pinCodeKey)
        } catch {
            print("error: \(error)")
        }
    }

}
