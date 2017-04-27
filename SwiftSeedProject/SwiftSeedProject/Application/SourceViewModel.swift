//
//  SourceViewModel.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 18/4/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation
import Bond

class SourceViewModel {
    
    let identifier: Observable<String>
    let name: Observable<String>
    let url: Observable<URL>
    let detail: Observable<String>
    let language: Observable<Language>
    let country: Observable<Country>
    let category: Observable<SourceCategory>
    
    init(source: Source) {
        self.identifier = Observable<String>(source.identifier)
        self.name = Observable<String>(source.name!)
        self.url = Observable<URL>(source.url!)
        self.detail = Observable<String>(source.detail!)
        self.language = Observable<Language>(source.language)
        self.country = Observable<Country>(source.country)
        self.category = Observable<SourceCategory>(source.category)
    }
    
}
