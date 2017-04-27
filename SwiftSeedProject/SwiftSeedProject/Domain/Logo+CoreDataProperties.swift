//
//  Logo+CoreDataProperties.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 18/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

extension Logo {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Logo> {
        return NSFetchRequest<Logo>(entityName: "Logo")
    }
    
    @NSManaged public var small: URL?
    @NSManaged public var medium: URL?
    @NSManaged public var large: URL?

}
