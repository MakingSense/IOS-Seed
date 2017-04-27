//
//  BaseService.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/13/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

class BaseService<T: PersistenceObject>  {
    
    internal let persistence: Persistence!
    internal let newsApiRestClient: RestClient!

    init(persistence: Persistence, newsApiRestClient: RestClient) {
        self.persistence = persistence
        self.newsApiRestClient = newsApiRestClient
    }
    
    public func getAll() -> [T] {
        return persistence.getAll(entityName: T.EntityName)
    }
    
    public func getEntityBy(identifier: String) -> T? {
        return persistence.getBy(entityIdentifier: identifier)
    }
    
    public func updateLocalStoreWithServerInfo() {
        preconditionFailure("This method must be overridden")
    }
    
    public func getNotificationKeyName() -> Notification.Name {
        return Notification.Name(rawValue:persistence.getNotificationTagfor(entity: T.EntityName))
    }
}
