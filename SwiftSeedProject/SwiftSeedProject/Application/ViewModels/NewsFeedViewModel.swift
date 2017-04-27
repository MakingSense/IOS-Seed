//
//  NewsFeedViewModel.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/21/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Bond

class NewsFeedViewModel {
    
    private let libraryService: LibraryService!
    let newsArticles = MutableObservableArray<ArticleViewModel>()
    
    init(libraryService: LibraryService) {
        self.libraryService = libraryService
        self.setupNotifications()
    }
    
    private func setupNotifications() {
        // MARK: Library updated notification
        NotificationCenter
            .default
            .reactive
            .notification(name: libraryService.getNotificationKeyName())
            .observeNext { [weak self] _ in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.getArticlesBy(sourceID: "")
            }
            .dispose(in: NotificationCenter.default.reactive.bag)
    }
    
    private func getArticlesBy(sourceID: String) {
        let library: Library? = libraryService.getEntityBy(source: sourceID)
        if let library = library {
            newsArticles.replace(with: library.articles!.map { ArticleViewModel(article: $0 as! Article) })
        }
    }
    
    func requestNewsArticlesFromServer() {
        libraryService.updateLocalStoreWithServerInfo()
    }
}
