//
//  ManagedObjectConvertibble.swift
//  TinkoffProject
//
//  Created by pro on 04.03.2020.
//  Copyright © 2020 Tinkoff. All rights reserved.
//

import Foundation
import CoreData

public protocol ManagedObjectConvertible {
    associatedtype ManagedObject: NSManagedObject, ManagedObjectProtocol
    @discardableResult func toManagedObject(in context: NSManagedObjectContext) -> ManagedObject
}
