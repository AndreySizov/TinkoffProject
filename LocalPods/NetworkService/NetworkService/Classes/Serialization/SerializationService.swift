//
//  NetowrkService.swift
//  NetworkService_Example
//
//  Created by Oleg on 01.03.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

public final class SerializationService {

    // MARK: - Properties
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    public init() {
        encoder.keyEncodingStrategy = .convertToSnakeCase
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

}

extension SerializationService: SerializationServiceProtocol {

    public func serialize<T>(_ value: T) throws -> Data where T: Encodable {
        return try encoder.encode(value)
    }

    public func deserialize<T>(_ data: Data) throws -> T where T: Decodable {
        return try decoder.decode(T.self, from: data)
    }

}
