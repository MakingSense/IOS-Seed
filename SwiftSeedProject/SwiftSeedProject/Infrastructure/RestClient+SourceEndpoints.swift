//
//  RestClient+Source.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 21/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import SwiftyJSON

extension RestClient {
    
    func getSources(category: SourceCategory? = nil, language: Language? = nil, country: Country? = nil, completion: @escaping (DataResult<[Source]>) -> Void) {
        self.execute(target: NewsApiTarget.GetSources(category: category, language: language, country: country), completion: completion)  { [weak self] json in
            guard let strongSelf = self else {
                return nil
            }
            let sources = json["sources"].arrayValue.map { (json: JSON) -> Source in
                let id = json["id"].stringValue
                let source = strongSelf.persistence.getBy(entityIdentifier: id) as Source? ?? strongSelf.persistence.add(attributes: nil, entityName: Source.EntityName) as! Source
                source.updateWithJSON(json: json)
                return source
            }
            return sources
        }
    }
}
