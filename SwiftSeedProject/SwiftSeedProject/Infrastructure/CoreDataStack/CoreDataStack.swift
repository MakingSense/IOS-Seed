//
//  CoreDataStack.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 3/30/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import CoreData
import Foundation

class CoreDataStack {
    
    typealias CoreDataStackCompletion = () -> ()
    
    private let modelName: String
    private let completion: CoreDataStackCompletion
    
    private var persistentStoreURL: NSURL {
        let storeName = "\(modelName).sqlite"
        let fileManager = FileManager.default
        let documentsDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsDirectoryURL.appendingPathComponent(storeName) as NSURL
    }
    
    private lazy var managedObjectModel: NSManagedObjectModel? = {
        // The mom and momd files are compiled versions of xcdatamodel and xcdatamodeld files.
        guard let modelURL = Bundle.main.url(forResource: self.modelName, withExtension: "momd") else {
            return nil
        }
        return NSManagedObjectModel(contentsOf: modelURL)
    }()
    
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        guard let managedObjectModel = self.managedObjectModel else {
            return nil
        }
        return NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
    }()
    
    private lazy var privateManagedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
        return managedObjectContext
    }()
    
    public private(set) lazy var mainManagedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.parent = self.privateManagedObjectContext
        return managedObjectContext
    }()
    
    init(modelName: String, completion: @escaping CoreDataStackCompletion) {
        self.modelName = modelName
        self.completion = completion
        setupCoreDataStack()
    }
    
    private func setupCoreDataStack() {
        let _ = mainManagedObjectContext.persistentStoreCoordinator
        
        DispatchQueue.global().async {
            self.addPersistentStore()
            DispatchQueue.main.async { self.completion() }
        }
    }
    
    private func addPersistentStore() {
        guard let persistentStoreCoordinator = persistentStoreCoordinator else { fatalError("Unable to Initialize Persistent Store Coordinator") }
        
        let persistentStoreURL = self.persistentStoreURL
        do {
            let options = [ NSMigratePersistentStoresAutomaticallyOption : true, NSInferMappingModelAutomaticallyOption : true ]
            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: persistentStoreURL as URL, options: options)
            
        } catch {
            let addPersistentStoreError = error as NSError
            
            print("Unable to Add Persistent Store")
            print("\(addPersistentStoreError.localizedDescription)")
        }
    }
    
    // MARK: - Helper Methods
    
    public func saveChanges() {
        mainManagedObjectContext.performAndWait({
            self.save(managedObjectContext: self.mainManagedObjectContext, errorMSG: "Unable to Save Changes of Main Managed Object Context")
        })
        
        privateManagedObjectContext.perform({
            self.save(managedObjectContext: self.privateManagedObjectContext, errorMSG: "Unable to Save Changes of Private Managed Object Context")
        })
    }
    
    private func save(managedObjectContext: NSManagedObjectContext, errorMSG: String)
    {
        do {
            if self.mainManagedObjectContext.hasChanges {
                try self.mainManagedObjectContext.save()
            }
        } catch {
            let saveError = error as NSError
            print(errorMSG)
            print("\(saveError), \(saveError.localizedDescription)")
        }
    }
    
    public func privateChildManagedObjectContext() -> NSManagedObjectContext {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        managedObjectContext.parent = mainManagedObjectContext
        
        return managedObjectContext
    }
}
