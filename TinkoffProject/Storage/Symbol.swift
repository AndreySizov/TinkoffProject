//
//  Language.swift
//  TinkoffProject
//
//  Created by pro on 02.03.2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

import Foundation
import CoreData

struct Symbol: Decodable {
    let symbolId: String
    let symbolDescription: String
    let displaySymbol: String
}
 
extension Symbol: ManagedObjectConvertible {
    typealias ManagedObject = ManagedSymbol
    
    func toManagedObject(in context: NSManagedObjectContext) -> ManagedSymbol {
        let predicate = NSPredicate(format: "symbolId == %@", symbolId)
        let managedSymbol = ManagedSymbol.findOrInsertObject(predicate: predicate, in: context)
        managedSymbol.symbolId = symbolId
        managedSymbol.symbolDescription = symbolDescription
        managedSymbol.displaySymbol = displaySymbol
        return managedSymbol
    }
}
