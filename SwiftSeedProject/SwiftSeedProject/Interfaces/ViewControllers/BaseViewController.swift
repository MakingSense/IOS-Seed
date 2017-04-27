//
//  BaseViewController.swift
//  SwiftSeedProject
//
//  Created by Lucas Pelizza on 4/21/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseViewControllerProtocol {

    internal func navigateTo(vc:UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
