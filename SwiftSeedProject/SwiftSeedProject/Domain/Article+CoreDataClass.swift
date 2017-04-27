//
//  Article+CoreDataClass.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/13/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

@objc(Article)
public class Article: PersistenceObject {

    class override var EntityName: String {
        return "Article"
    }
    
    override func updateWithJSON(json: JSON) {
        self.author = json["author"].stringValue
        self.detail = json["description"].stringValue
        self.url = URL(string: json["url"].stringValue)!
        self.urlToImage = URL(string: json["urlToImage"].stringValue)!
        self.publishedAt = DateUtils.parse(dateString: json["publishedAt"].stringValue) as NSDate
    }
}
