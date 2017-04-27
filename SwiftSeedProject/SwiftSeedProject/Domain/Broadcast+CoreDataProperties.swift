//
//  Broadcast+CoreDataProperties.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/13/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import CoreData


extension Broadcast {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Broadcast> {
        return NSFetchRequest<Broadcast>(entityName: "Broadcast")
    }

    @NSManaged public var sources: NSSet?

}

// MARK: Generated accessors for sources
extension Broadcast {

    @objc(addSourcesObject:)
    @NSManaged public func addToSources(_ value: Source)

    @objc(removeSourcesObject:)
    @NSManaged public func removeFromSources(_ value: Source)

    @objc(addSources:)
    @NSManaged public func addToSources(_ values: NSSet)

    @objc(removeSources:)
    @NSManaged public func removeFromSources(_ values: NSSet)

}
