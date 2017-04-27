//
//  Article+CoreDataProperties.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/13/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var author: String?
    @NSManaged public var title: String?
    @NSManaged public var detail: String?
    @NSManaged public var url: URL?
    @NSManaged public var urlToImage: URL?
    @NSManaged public var publishedAt: NSDate?
    @NSManaged public var identifier: Int16
    @NSManaged public var library: Library?

}
