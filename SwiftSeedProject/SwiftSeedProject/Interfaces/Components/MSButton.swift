//
//  MSButton.swift
//  SwiftSeedProject
//
//  Created by Mugu on 3/20/17.
//  Copyright © 2017 Making Sense. All rights reserved.
//

import UIKit

@IBDesignable public class MSButton: UIButton {

    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
            setNeedsLayout()
        }
    }

    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
            setNeedsLayout()
        }
    }
    
    @IBInspectable var rounded: Bool = true {
        didSet {
            applyCornerRadius()
        }
    }
    
    @IBInspectable var radius: CGFloat = 0.5 {
        didSet {
            applyCornerRadius()
        }
    }

    
    private func applyCornerRadius() {
        layer.cornerRadius = rounded ? radius * bounds.size.width : 0
        clipsToBounds = true
        setNeedsLayout()
    }
}
