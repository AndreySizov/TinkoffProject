//
//  StorageManager.swift
//  TinkoffProject
//
//  Created by pro on 02.03.2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

import Foundation
import CoreData

protocol IStorageManager {
    func write<T: ManagedObjectConvertible>(_ objects: [T])
    func deleteAll<T: ManagedObjectConvertible>(_ object: T.Type)
    func readAll<T: ManagedObjectConvertible>(completion: @escaping ([T]) -> Void)
}

class StorageManager: IStorageManager {
    let coreDataStack = CoreDataStack.shared
    var saveContext: NSManagedObjectContext {
        return coreDataStack.saveContext
    }
    
    func write<T: ManagedObjectConvertible>(_ objects: [T]) {
        saveContext.perform { [weak self] in
            guard let self = self else { return }
            _ = objects.map { $0.toManagedObject(in: self.saveContext) }
            self.coreDataStack.performSave(with: self.saveContext)
        }
    }
    
    func readAll<T: ManagedObjectConvertible>(completion: @escaping ([T]) -> Void) {
        saveContext.perform { [weak self] in
            guard let self = self else { return }
            let results = T.ManagedObject.fetch(from: self.saveContext)
            let objects = results?.compactMap { $0.toEntity() as? T } ?? []
            completion(objects)
        }
    }
    
    func deleteAll<T: ManagedObjectConvertible>(_ object: T.Type) {
        readAll { [weak self] (objects: [T]) in
            guard let self = self else { return }
            self.saveContext.perform {
                objects.forEach { self.saveContext.delete($0.toManagedObject(in: self.saveContext)) }
            }
            self.coreDataStack.performSave(with: self.saveContext)
        }
    }
}
