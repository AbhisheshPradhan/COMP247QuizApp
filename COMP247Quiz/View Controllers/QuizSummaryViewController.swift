//
//  QuizSummaryViewController.swift
//  COMP247Quiz
//
//  Created by Abhishesh Pradhan on 5/4/18.
//  Copyright © 2018 Abhishesh Pradhan. All rights reserved.
//

import UIKit

class QuizSummaryViewController: UIViewController {

    var score:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        scoreLabel.text = "Score : \(score)"
        scoreLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        // Do any additional setup after loading the view.
        
        //hide back button
        self.navigationItem.setHidesBackButton(true, animated:true)
    }
    @IBOutlet weak var scoreLabel: UILabel!
    
    private func setupUI(){
        view.setGradientBackground(colorOne: Colors.gradientColor1, colorTwo: Colors.gradientColor2)
        
        //  beginButton.layer.cornerRadius = beginButton.frame.size.height / 5
        //beginButton.setTitle("", for: .normal)
        
    }
}
