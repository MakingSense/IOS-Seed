//
//  DateUtils.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 17/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

class DateUtils {
    
    struct Format {
        static let ISO8601 = "yyyy-MM-dd'T'HH:mm:ssZ"
    }
    
    static func parse(dateString: String, format: String? = Format.ISO8601) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: dateString)!
    }
    
}
