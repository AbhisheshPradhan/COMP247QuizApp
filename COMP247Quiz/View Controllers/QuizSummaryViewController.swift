//
//  QuizSummaryViewController.swift
//  COMP247Quiz
//
//  Created by Abhishesh Pradhan on 5/4/18.
//  Copyright © 2018 Abhishesh Pradhan. All rights reserved.
//

import UIKit

class QuizSummaryViewController: UIViewController{
    
    //MARK : Variables
    
    var score:Int = 0
    var topic: Topic?
    var topicNumber: Int = 0
    var currentHighScore: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.string(forKey: (topic?.topicName)!)
        currentHighScore = value
        setHighScore()
    }
    
    
    //MARK : OUTLETS
    
    @IBOutlet weak var scoreLabel: UILabel!{
        didSet{
            scoreLabel.text = "Score : \(score)"
            scoreLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    @IBOutlet weak var restartButton: UIButton!{
        didSet{setupButton(restartButton)}}
    
    @IBOutlet weak var homeButton: UIButton!{
        didSet{setupButton(homeButton)}}
    
    
    //MARK : ACTIONS SEGUES
    
    @IBAction func gotoHome(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func restartQuiz(_ sender: UIButton) {
        performSegue(withIdentifier: "restartQuiz", sender: self)
    }
    
    
    //MARK : HELPER METHODS
    
    func setupButton(_ button: UIButton!){
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.0479086861, green: 0.1120770648, blue: 0.1909584403, alpha: 1)
        button.layer.cornerRadius = button.frame.size.height / 5
    }
    
    func setHighScore(){
        if currentHighScore == nil{
            let newScore = score
            let userDefaults = Foundation.UserDefaults.standard
            userDefaults.set(newScore, forKey: (topic?.topicName)! )
        }
        else {
            if score > Int(currentHighScore)! {
                let newScore = score
                let userDefaults = Foundation.UserDefaults.standard
                userDefaults.set(newScore, forKey: (topic?.topicName)! )
            }
        }
    }
    
    private func setupUI(){
        view.setGradientBackground(colorOne: Colors.gradientColor1, colorTwo: Colors.gradientColor2)
    }
    
    
    //MARK : SEGUES
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? QuizViewController{
            destination.topic = topic
            destination.answered = false
            destination.currentQuestion = 0
            destination.topicNumber = topicNumber
            destination.score = 0
          //  print(topicNumber)
        }
    }
}
