//
//  AppDelegate.swift
//  NetworkService
//
//  Created by Oleg Sinev on 03/01/2020.
//  Copyright (c) 2020 Oleg Sinev. All rights reserved.
//

extension NetworkService {

    enum ServerError: Error {

        case noConnection
        case requestFailed
        case emptyResponse
        case invalidResponse(underlyingError: Error)
        case invalidURL

        var description: String {
            switch self {
            case .requestFailed:
                return "ServerError.requestFailed"
            case .noConnection:
                return "ServerError.noConnection"
            case .emptyResponse:
                return "ServerError.emptyResponse"
            case .invalidResponse:
                return "ServerError.invalidResponse"
            case .invalidURL:
                return "ServerError.invalidURL"
            }
        }

    }

}
