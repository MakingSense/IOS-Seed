//
//  NewsCollectionViewCell.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/18/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit
import Bond
import SDWebImage

final class NewsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewsCollectionViewCell"
    static let Height = 80.0
    
    @IBOutlet weak var imgDetail: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    
    func configure(viewModel: ArticleViewModel) {
        lblDescription.text = viewModel.description
        lblTitle.text = viewModel.title
        lblAuthor.text = viewModel.author
        lblDate.text = "\(viewModel.date)"
        imgDetail.sd_setImage(with: viewModel.imageUrl, placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    override func layoutSubviews() {
        imgDetail.layer.borderWidth = 1
        imgDetail.layer.borderColor = UIColor.green.cgColor
        imgDetail.layer.cornerRadius = imgDetail.frame.size.width / 2;
        imgDetail.clipsToBounds = true;
    }
}
