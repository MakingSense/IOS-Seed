//
//  ViewController.swift
//  SwiftSeedProject
//
//  Created by Mugu on 3/17/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit
import Bond
import Dip_UI
import Dip

class SourceListViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var getButton: UIButton!
    @IBOutlet var putButton: UIButton!
    @IBOutlet var postButton: UIButton!
    
    var viewModel: SourceListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        getButton.reactive.tap
            .observe { _ in
                self.viewModel.requestSourcesFromServer()
            }.dispose(in: reactive.bag)
    }

}

extension SourceListViewController: StoryboardInstantiatable { }
