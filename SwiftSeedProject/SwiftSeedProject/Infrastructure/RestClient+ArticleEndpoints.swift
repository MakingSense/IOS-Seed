//
//  RestClient+Article.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 21/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import SwiftyJSON

extension RestClient {
    
    func getArticles(source: Source, sortBy: String? = nil, completion: @escaping (DataResult<[Article]>) -> Void) {
        self.execute(target: NewsApiTarget.GetArticles(source: source, sortBy: sortBy), completion: completion) { [weak self] json in
            guard let strongSelf = self else {
                return nil
            }
            let articles = json["articles"].arrayValue.map { (json: JSON) -> Article in
                let article = strongSelf.persistence.add(attributes: nil, entityName: Source.EntityName) as! Article
                article.updateWithJSON(json: json)
                return article
            }
            return articles
        }
    }
}
