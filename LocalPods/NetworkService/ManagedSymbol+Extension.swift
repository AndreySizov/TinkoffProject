//
//  ExtensionManagedSymbol.swift
//  TinkoffProject
//
//  Created by pro on 04.03.2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

import Foundation

extension ManagedSymbol: ManagedObjectProtocol {
    public func toEntity() -> Symbol? {
        guard let symbolId = symbolId, let symbolDescription = symbolDescription, let displaySymbol = displaySymbol else { return nil }
        return Symbol(symbolId: symbolId, symbolDescription: symbolDescription, displaySymbol: displaySymbol)
    }
}
