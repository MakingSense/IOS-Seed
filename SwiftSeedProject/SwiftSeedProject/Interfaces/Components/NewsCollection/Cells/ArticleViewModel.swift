//
//  ArticleViewModel.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/18/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Bond

final class ArticleViewModel {
    
    var imageUrl: URL
    var date: NSDate
    var description: String
    var title: String
    var author: String
    var sourceURL: URL
    
    init(article: Article) {
        self.imageUrl = article.urlToImage!
        self.date = article.publishedAt!
        self.description = article.detail!
        self.title = article.title!
        self.author = article.author!
        self.sourceURL = article.url!
    }
}
