//
//  UIViewExtension.swift
//  COMP247Quiz
//
//  Created by Abhishesh Pradhan on 1/4/18.
//  Copyright © 2018 Abhishesh Pradhan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    //Function takes 2 UIColors and creates a diagonal gradient
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
