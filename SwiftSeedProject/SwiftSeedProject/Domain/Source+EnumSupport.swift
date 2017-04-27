//
//  Source+Enums.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 18/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

extension Source {
    
    var language: Language {
        get { return Language(rawValue: languageRaw!)! }
        set { languageRaw = newValue.rawValue }
    }
    
    var country: Country {
        get { return Country(rawValue: countryRaw!)! }
        set { countryRaw = newValue.rawValue }
    }
    
    var category: SourceCategory {
        get { return SourceCategory(rawValue: categoryRaw!)! }
        set { categoryRaw = newValue.rawValue }
    }
}
