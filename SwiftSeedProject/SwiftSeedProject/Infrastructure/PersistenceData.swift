//
//  PersistenceData.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/10/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import CoreData

class PersistenceData: Persistence {
    
    static let NotificationTag = "%@EntityHasChanged"
    
    let coreDataManager: CoreDataStack
    
    init(coreDataManager: CoreDataStack) {
        self.coreDataManager = coreDataManager
    }
    
    public func getAll<T: PersistenceObject>(entityName: String) -> [T] {
        let objectContext = coreDataManager.mainManagedObjectContext
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        do {
            let fetchedObjects = try objectContext.fetch(fetch) as! [T]
            return fetchedObjects
        } catch let error as NSError {
            fatalError("Failed to fetch \(entityName): \(error)")
        }
        return []
    }
    
    public func getCustomBy<T: PersistenceObject>(attributeName: String, attributeValue: String) -> T? {
        let objectContext = coreDataManager.mainManagedObjectContext
        let fetch: NSFetchRequest<NSFetchRequestResult> = T.fetchRequest()
        fetch.predicate = NSPredicate(format: "(%@ = %@)", attributeName, attributeValue)
        fetch.fetchLimit = 1
        do {
            let fetchedObjects = try objectContext.fetch(fetch)
            return fetchedObjects.count > 0 ? fetchedObjects.item(at: 0) as? T : nil
        } catch let error as NSError {
            fatalError("Failed to fetch \(T.EntityName): \(error)")
        }
    }
    
    public func getBy<T: PersistenceObject>(entityIdentifier: String) -> T? {
        return getCustomBy(attributeName: "identifier", attributeValue: entityIdentifier)
    }
    
    public func add<T: PersistenceObject>(attributes: [String : AnyObject]? = nil, entityName: String) -> T {
        let objectContext = coreDataManager.mainManagedObjectContext
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: objectContext)!
        let entityModel = NSManagedObject(entity: entity, insertInto: objectContext)
        
        if let attributes = attributes {
            for (key, value) in attributes {
                entityModel.setValue(value, forKey: key)
            }
        }
        do {
            try objectContext.save()
            return entityModel as! T
        } catch let error as NSError {
            fatalError("Failed to save one new \(entityName): \(error)")
        }
    }
    
    public func addAll<T: PersistenceObject>(entity: [T], entityName: String) {
        preconditionFailure("This method must be completed")
        entityHasChanged(entity: entityName)
    }
    
    public func save() {
        coreDataManager.saveChanges()
    }
    
    public func getNotificationTagfor(entity: String) -> String {
        return String(format: PersistenceData.NotificationTag, entity)
    }
    
    private func entityHasChanged(entity: String) {
        let nc = NotificationCenter.default
        nc.post(name:NSNotification.Name(rawValue: getNotificationTagfor(entity: entity)), object: nil)
    }
}
