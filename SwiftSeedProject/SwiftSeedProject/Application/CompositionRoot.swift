//
//  CompositionRoot.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/5/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import Dip
import Dip_UI

extension DependencyContainer {
    
    //TODO: we need to create protocols
    static func configure() -> DependencyContainer {
        return DependencyContainer { container in
            container.register(.singleton){ CoreDataStack(modelName: "DataModel", completion: {}) as CoreDataStack }

            container.register{ PersistenceData(coreDataManager: try! container.resolve() as CoreDataStack) as Persistence }
            
// MARK: - Services
            container.register(.singleton) { try RestClient(persistence: container.resolve()) as RestClient }
            
            //Comment: to mock the service we need to use Persistence mock
            container.register(){ try BroadcastService(persistence: container.resolve(), newsApiRestClient: container.resolve() as RestClient) as BroadcastService}
            container.register(){ try ArticleService(persistence: container.resolve(), newsApiRestClient: container.resolve() as RestClient) as ArticleService}
            container.register(){ try SourceService(persistence: container.resolve(), newsApiRestClient: container.resolve() as RestClient) as SourceService}
            container.register(){ try LibraryService(persistence: container.resolve(), newsApiRestClient: container.resolve() as RestClient) as LibraryService}
            
// MARK: - View Models
            container.register { try SourceListViewModel(sourceService: container.resolve() as SourceService) as SourceListViewModel }
            container.register { try NewsFeedViewModel(libraryService: container.resolve() as LibraryService) as NewsFeedViewModel }

// MARK: - View Controllers
            container.register(tag: "SourceListVC") { SourceListViewController() }
                .resolvingProperties { container, controller in
                    controller.viewModel = try container.resolve() as SourceListViewModel
            }
            
            container.register(tag: "NewsFeedCollectionViewController") { NewsFeedCollectionViewController() }
                .resolvingProperties { container, controller in
                    controller.viewModel = try container.resolve() as NewsFeedViewModel
            }
            
            DependencyContainer.uiContainers = [container]

        }
    }
    
}
