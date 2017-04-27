//
//  Dictionary+Extensions.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 6/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

public func += <K, V> ( left: inout [K : V], right: [K : V]) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}
