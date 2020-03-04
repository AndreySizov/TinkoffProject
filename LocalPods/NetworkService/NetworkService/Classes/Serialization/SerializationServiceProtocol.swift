//
//  NetowrkService.swift
//  NetworkService_Example
//
//  Created by Oleg on 01.03.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

public protocol SerializationServiceProtocol {
    /**
     Создает JSON-кодированное значения.
     - Parameter value: Значение сериализации
     - Returns: JSON-encoded data.
     - Authors: Oleg Sinev
     */
    func serialize<T: Encodable>(_ value: T) throws -> Data
    /**
     Создает объект из JSON
     - Parameter data: JSON-encoded data.
     - Returns: Объект
     - Authors: Oleg Sinev
     */
    func deserialize<T: Decodable>(_ data: Data) throws -> T
}

