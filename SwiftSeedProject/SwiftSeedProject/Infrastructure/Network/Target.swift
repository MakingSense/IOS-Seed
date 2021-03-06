//
//  Endpoint.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 3/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol Target {
    var baseUrl: URL { get }
    var apiKey: String? { get }
    var commonHeaders: [String : String]? { get }
    var method: HTTPMethod { get }
    var url: URL { get }
    var errorSanitizer: (JSON) -> Result<JSON> { get }
}
