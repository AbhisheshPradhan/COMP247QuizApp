//
//  ViewController.swift
//  COMP247Quiz
//
//  Created by Abhishesh Pradhan on 1/4/18.
//  Copyright © 2018 Abhishesh Pradhan. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
      //  self.navigationItem.title = "COMP247 QUIZ"
    }
    
    @IBOutlet weak var beginButton: UIButton!
    
    private func setupUI(){
        view.setGradientBackground(colorOne: Colors.gradientColor1, colorTwo: Colors.gradientColor2)
        beginButton.layer.cornerRadius = beginButton.frame.size.height / 5
        beginButton.setTitle("Begin", for: .normal)
   
    }
    
    
}

