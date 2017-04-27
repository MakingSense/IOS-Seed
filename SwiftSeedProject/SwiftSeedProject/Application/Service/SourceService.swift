//
//  SourceService.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/13/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Foundation

final class SourceService: BaseService<Source> {
    
    public override func updateLocalStoreWithServerInfo() {
        newsApiRestClient.getSources(language: Language.English) { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            NotificationCenter.default.post(name: strongSelf.getNotificationKeyName(), object: nil)
        }
    }
}
