//
//  Logo+CoreDataClass.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 18/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

@objc(Logo)
public class Logo: PersistenceObject {
    
    class override var EntityName: String {
        return "Logo"
    }
    
    override func updateWithJSON(json: JSON) {
        self.small = URL(string: json["small"].stringValue)!
        self.medium = URL(string: json["medium"].stringValue)!
        self.large = URL(string: json["large"].stringValue)!
    }

}
