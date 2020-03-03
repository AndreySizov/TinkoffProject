//
//  AppDelegate.swift
//  NetworkService
//
//  Created by Oleg Sinev on 03/01/2020.
//  Copyright (c) 2020 Oleg Sinev. All rights reserved.
//

import RxSwift

public protocol NetworkServiceProtocol {
    /**
     Отправляет запрос на сервер
     - Parameter request: Модель для создания session request.
     - Returns: Observable-encoded модель.
     - Throws: Ошибка типа "ServerError".
     - Author: Oleg Sinev
     */
    func data<T: Decodable>(for request: Request) -> Single<T>
}
