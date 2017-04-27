//
//  Source+CoreDataProperties.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/13/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import CoreData

extension Source {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Source> {
        return NSFetchRequest<Source>(entityName: "Source")
    }

    @NSManaged public var identifier: String
    @NSManaged public var url: URL?
    @NSManaged public var detail: String?
    @NSManaged public var name: String?
    @NSManaged public var languageRaw: String?
    @NSManaged public var countryRaw: String?
    @NSManaged public var categoryRaw: String?
    @NSManaged public var logo: Logo?
    @NSManaged public var sortByAvailable: Array<String>?
    @NSManaged public var broadcast: Broadcast?

}
