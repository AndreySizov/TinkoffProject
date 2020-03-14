//
//  Symbol.swift
//  Stocks
//
//  Created by Андрей on 08/03/2020.
//  Copyright © 2020 AnSiz. All rights reserved.
//

import StorageManager
import CoreData

public struct Symbol: Decodable {
    let symbolId: String
    let symbolDescription: String
    let displaySymbol: String
    
    enum CodingKeys: String, CodingKey {
        case symbolId = "symbol"
        case symbolDescription = "description"
        case displaySymbol = "displaySymbol"
    }
}
 
extension Symbol: ManagedObjectConvertible {
    public typealias ManagedObject = ManagedSymbol
    
    public func toManagedObject(in context: NSManagedObjectContext) -> ManagedSymbol {
        let predicate = NSPredicate(format: "symbolId == %@", symbolId)
        let managedSymbol = ManagedSymbol.findOrInsertObject(predicate: predicate, in: context)
        managedSymbol.symbolId = symbolId
        managedSymbol.symbolDescription = symbolDescription
        managedSymbol.displaySymbol = displaySymbol
        return managedSymbol
    }
}
