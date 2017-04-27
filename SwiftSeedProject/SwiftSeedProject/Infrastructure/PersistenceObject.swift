//
//  PersistenceObject.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 3/31/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import CoreData
import SwiftyJSON

public class PersistenceObject: NSManagedObject {
    
    class var EntityName: String {
        return ""
    }
    
    func updateWithJSON(json: JSON) {
        preconditionFailure("This method must be overridden")
    }
}
