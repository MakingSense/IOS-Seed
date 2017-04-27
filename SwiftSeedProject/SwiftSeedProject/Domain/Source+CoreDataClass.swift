//
//  Source+CoreDataClass.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/13/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

@objc(Source)
public class Source: PersistenceObject {

    class override var EntityName: String {
        return "Source"
    }
    
    override func updateWithJSON(json: JSON) {
        self.identifier = json["id"].stringValue
        self.url = URL(string: json["url"].stringValue)!
        self.detail = json["description"].stringValue
        self.name = json["name"].stringValue
        self.categoryRaw = json["category"].stringValue
        self.languageRaw = json["language"].stringValue
        self.countryRaw = json["country"].stringValue
        self.sortByAvailable = json["sortBysAvailable"].arrayValue.map { $0.stringValue }
    }
}
