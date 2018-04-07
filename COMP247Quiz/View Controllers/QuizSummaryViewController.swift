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
    var topic: Topic? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Do any additional setup after loading the view.
        
        //hide back button
        self.navigationItem.setHidesBackButton(true, animated:true)
    }
    @IBOutlet weak var scoreLabel: UILabel!{
        didSet{
            scoreLabel.text = "Score : \(score)"
            scoreLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    @IBOutlet weak var restartButton: UIButton!{
        didSet{
        setupButton(restartButton)
        }
    }
    
    @IBOutlet weak var homeButton: UIButton!{
        didSet{
       setupButton(homeButton)
        }
    }
    
    func setupButton(_ button: UIButton!){
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.0479086861, green: 0.1120770648, blue: 0.1909584403, alpha: 1)
        button.layer.cornerRadius = button.frame.size.height / 5
    }
    
    @IBAction func gotoHome(_ sender: UIButton) {
        //    performSegue(withIdentifier: , sender: sender)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func restartQuiz(_ sender: UIButton) {
       // self.present(QuizViewController(), animated: true, completion: nil)
         performSegue(withIdentifier: "restartQuiz", sender: self)
    //     navigationController?.popViewController(animated: true)
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? QuizViewController{
                destination.topic = topic
                destination.answered = false
                destination.currentQuestion = 0
                destination.score = 0
            }
        }
    
    private func setupUI(){
        view.setGradientBackground(colorOne: Colors.gradientColor1, colorTwo: Colors.gradientColor2)
    }
}
