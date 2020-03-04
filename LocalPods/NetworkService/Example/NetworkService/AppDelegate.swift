//
//  AppDelegate.swift
//  NetworkService
//
//  Created by Oleg Sinev on 03/01/2020.
//  Copyright (c) 2020 Oleg Sinev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NetworkService

struct Symbol: Decodable {
    let description: String
    let displaySymbol: String
    let symbol: String
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let disposeBag = DisposeBag()
    private let networkService = NetworkService(serializationService: SerializationService(),
                                                baseURL: "https://finnhub.io/api/")

    private func getSymbols(with exchange: String) -> Single<[Symbol]> {
        let request = Request(query: "stock/symbol?exchange=\(exchange)&token=bpdsijnrh5rauiikk95g", method: .get)
        return networkService.data(for: request)
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let exchange = "US"
        getSymbols(with: exchange).subscribe(onSuccess: { [unowned self] symbols in
            print("!! success = ", symbols)
            }, onError: {
                print("!! error = ", $0)
            }).disposed(by: disposeBag)

        return true
    }

}

