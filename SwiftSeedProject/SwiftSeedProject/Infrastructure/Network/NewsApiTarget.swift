//
//  NewsApiEndpoint.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 20/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum NewsApiTarget: Target {
    
    var baseUrl: URL { return URL(string: "https://newsapi.org/v1")! }
    var apiKey: String? { return "983e399a3d2840759a3688c3abd91d77" }
    // Insert your common headers here, for example, authorization token or accept.
    var commonHeaders: [String : String]? { return ["X-Api-Key" : apiKey!] }
    
    case GetSources(category: SourceCategory?, language: Language?, country: Country?)
    case GetArticles(source: Source, sortBy: String?)
    
    // MARK: - Public Properties
    var method: HTTPMethod {
        switch self {
            case .GetSources:
                return .get
            case .GetArticles:
                return .get
        }
    }
    
    var url: URL {
        switch self {
            case .GetSources(let category, let language, let country):
                let url = baseUrl.appendingPathComponent("sources")
                return URL(string: "?category=\(category != nil ? category!.rawValue : "")&language=\(language != nil ? language!.rawValue : "")&country=\(country != nil ? country!.rawValue : "")", relativeTo: url)!
            case .GetArticles(let source, let sortBy):
                let url = baseUrl.appendingPathComponent("articles")
                guard let sortBy = sortBy else {
                    return URL(string: "?source=\(source.identifier)", relativeTo: url)!
                }
                return URL(string: "?source=\(source.identifier)&sortBy=\(sortBy)", relativeTo: url)!
        }
    }
    
    var errorSanitizer: (JSON) -> Result<JSON> {
        return { json in
            if json["status"].stringValue == "ok" {
                return .success(json)
            }
            
            let message = json["message"].stringValue
            let error = NSError(domain: InfoUtils.bundleNameKey(), code: ErrorCode.Undefined, userInfo: [NSLocalizedDescriptionKey : message])
            return .failure(error)
        }
    }
}
