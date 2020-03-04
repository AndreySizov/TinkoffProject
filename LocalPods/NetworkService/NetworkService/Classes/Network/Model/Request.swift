//
//  AppDelegate.swift
//  NetworkService
//
//  Created by Oleg Sinev on 03/01/2020.
//  Copyright (c) 2020 Oleg Sinev. All rights reserved.
//

public struct Request {

    // MARK: - Typealias
    public typealias RequestParams = [String: Any]

    // MARK: - Properties
    let query: String
    let method: RequestMethod
    let bodyParameters: RequestParams?
    let apiVersion: ApiVersion

    // MARK: - Init
    public init(query: String, method: RequestMethod, bodyParameters: RequestParams? = nil,
         apiVersion: ApiVersion = .v1) {
        self.query = query
        self.method = method
        self.bodyParameters = bodyParameters
        self.apiVersion = apiVersion
    }

}
