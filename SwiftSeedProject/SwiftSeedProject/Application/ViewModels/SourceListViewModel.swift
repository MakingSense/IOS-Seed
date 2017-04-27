//
//  ViewModel.swift
//  SwiftSeedProject
//
//  Created by Brian Sztamfater on 27/3/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Bond

class SourceListViewModel {
    
    private let sourceService: SourceService!
    
    let sources = MutableObservableArray<SourceViewModel>()
    
    init(sourceService: SourceService) {
        self.sourceService = sourceService
        self.setupNotifications()
    }
    
    private func setupNotifications() {
        // MARK - Sources updated notification
        NotificationCenter
            .default
            .reactive
            .notification(name: self.sourceService.getNotificationKeyName())
            .observeNext { [weak self] _ in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.getSources()
            }
            .dispose(in: NotificationCenter.default.reactive.bag)
    }
    
    private func getSources() {
        self.sources.replace(with: self.sourceService.getAll().map { SourceViewModel(source: $0) })
    }

    func requestSourcesFromServer() {
        self.sourceService.updateLocalStoreWithServerInfo()
    }

}
