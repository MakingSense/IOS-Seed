//
//  ApiManagerProtocol.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 6/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

protocol RestClientManagerProtocol {
    func sendRequest(target: Target, parameters: [String : AnyObject]?, headers: [String : String]?) -> RestClientRequestProtocol
}

extension RestClientManagerProtocol {
    func sendRequest(target: Target, parameters: [String : AnyObject]? = nil) -> RestClientRequestProtocol {
        return sendRequest(target: target, parameters: parameters, headers: nil)
    }
}
