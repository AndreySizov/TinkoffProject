//
//  ExchangeInteractor.swift
//  GenericTableTest
//
//  Created by Андрей on 08/03/2020.
//  Copyright © 2020 AnSiz. All rights reserved.
//

import RxSwift
import RxCocoa
import NetworkService

// MARK: - ExchangeInteractor
//получает данные
class ExchangeInteractor {
    private let disposeBag = DisposeBag()
    private let networkService = NetworkService(serializationService: SerializationService(),
                                                baseURL: "https://finnhub.io/api/")
    
    func getData(with exchange: String) -> Single<[Symbol]> {
        let request = Request(query: "stock/symbol?exchange=\(exchange)&token=bpdsijnrh5rauiikk95g", method: .get)
        return networkService.data(for: request)
    }
}
