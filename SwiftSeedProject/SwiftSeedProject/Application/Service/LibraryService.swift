//
//  LibraryService.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/13/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

final class LibraryService: BaseService<Library> {
    
    public override func updateLocalStoreWithServerInfo() {
        //TODO: We should add the API CALL HERE
    }
    
    public func getEntityBy(source: String) -> Library? {
           return persistence.getCustomBy(attributeName: "library.source", attributeValue: source)
    }
}
