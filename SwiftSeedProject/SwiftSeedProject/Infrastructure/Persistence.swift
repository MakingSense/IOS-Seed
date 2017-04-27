//
//  Persistence.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 3/31/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import CoreData

protocol Persistence {
    func getAll<T: PersistenceObject>(entityName: String) -> [T]
    func getBy<T: PersistenceObject>(entityIdentifier: String) -> T?
    func getCustomBy<T: PersistenceObject>(attributeName: String, attributeValue: String) -> T?
    func add<T: PersistenceObject>(attributes: [String : AnyObject]?, entityName: String) -> T
    func save()
    func getNotificationTagfor(entity: String) -> String
}
