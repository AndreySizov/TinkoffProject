//
//  ExtensionLanguage.swift
//  TinkoffProject
//
//  Created by pro on 02.03.2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

import Foundation
import CoreData

protocol ManagedObjectProtocol {
    associatedtype Entity
    func toEntity() -> Entity?
}

extension ManagedObjectProtocol where Self: NSManagedObject {
    
    static func fetch(
        from context: NSManagedObjectContext,
        with predicate: NSPredicate? = nil,
        sortDescriptors: [NSSortDescriptor]? = nil
    ) -> [Self]? {
        let fetchRequest = Self.fetchRequest()
        
        fetchRequest.sortDescriptors = sortDescriptors
        fetchRequest.predicate = predicate
        
        var result: [Self]?
        
        context.performAndWait {
            result = try? context.fetch(fetchRequest) as? [Self]
        }
        
        return result
    }
    
    static func insertObject(in context: NSManagedObjectContext) -> Self {
        return Self(context: context)
    }
    
    static func findOrInsertObject(predicate: NSPredicate, in context: NSManagedObjectContext) -> Self {
        if let object = fetch(from: context, with: predicate)?.first {
            return object
        }
        
        return Self.insertObject(in: context)
    }
 
}
