//
//  Adaptable.swift
//  Stocks
//
//  Created by Андрей on 09/03/2020.
//  Copyright © 2020 AnSiz. All rights reserved.
//

protocol Adaptable {
    associatedtype Model

    func adapt(model: Model)
}
