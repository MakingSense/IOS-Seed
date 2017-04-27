//
//  NewsFeedCollectionViewController.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/21/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//


import UIKit
import Bond
import Dip_UI
import Dip

class NewsFeedCollectionViewController: UICollectionViewController {

    private let reuseIdentifier = "NewsCollectionViewCell"
    var viewModel: NewsFeedViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.newsArticles.bind(to: collectionView!) { dataSource, indexPath, collectionView in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as! NewsCollectionViewCell
            cell.configure(viewModel: dataSource[indexPath.row])
            return cell
        }
    }
}

extension NewsFeedCollectionViewController: StoryboardInstantiatable { }
