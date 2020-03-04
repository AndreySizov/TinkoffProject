//
//  AppDelegate.swift
//  NetworkService
//
//  Created by Oleg Sinev on 03/01/2020.
//  Copyright (c) 2020 Oleg Sinev. All rights reserved.
//

import RxCocoa
import RxSwift

public final class NetworkService {

    // MARK: - Protocol properties
    private let serializationService: SerializationServiceProtocol
    private let baseURL: String

    // MARK: - Computed properties
    private var httpHeaders: [String: String] = {
        let timestamp = Int(Date().timeIntervalSince1970 + 15 * 60)
        return [
        "Content-Type": "application/json; charset=utf-8"
        ]
    }()

    // MARK: - Init
    public init(serializationService: SerializationServiceProtocol, baseURL: String) {
        self.serializationService = serializationService
        self.baseURL = baseURL
    }

    // MARK: - Private methods
    private func makeSessionRequest(from request: Request) throws -> URLRequest {
        let urlString = [baseURL, request.apiVersion.rawValue, request.query].joined(separator: "/")
        guard let url = URL(string: urlString) else {
            print("Session query url failed: base \(baseURL) and query \(request.query)")
            throw ServerError.invalidURL
        }

        var sessionRequest = URLRequest(url: url)
        sessionRequest.httpMethod = request.method.rawValue
        sessionRequest.allHTTPHeaderFields = httpHeaders
        sessionRequest.httpBody = request.bodyParameters?.toJSON()?.data(using: .utf8)

        return sessionRequest
    }

    private func performRequest<T: Decodable>(request: Request) -> Single<T> {
        guard let sessionRequest = try? makeSessionRequest(from: request) else {
            return .error(ServerError.invalidURL)
        }

        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 20
        sessionConfig.timeoutIntervalForResource = 20

        return URLSession(configuration: sessionConfig).rx.response(request: sessionRequest)
            .flatMap { [unowned self] response, data -> Observable<T> in
                let responseString = String(data: data, encoding: .utf8)
                do {
                    let successData: T = try self.serializationService.deserialize(data)
                    return Observable.just(successData)
                } catch let deserializationError {
                    #if DEBUG_NETWORK_INTERACTION
                    print(deserializationError.localizedDescription)
                    #endif
                    return Observable.error(deserializationError)
                }
            }.asSingle()
    }

}

// MARK: - NetworkServiceProtocol
extension NetworkService: NetworkServiceProtocol {

    public func data<T: Decodable>(for request: Request) -> Single<T> {
        return performRequest(request: request)
    }

}
