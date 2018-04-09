//
//  QuizViewController.swift
//  COMP247Quiz
//
//  Created by Abhishesh Pradhan on 4/4/18.
//  Copyright © 2018 Abhishesh Pradhan. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController{
    
    //MARK : Variables
    
    var topic: Topic?
    var topicName: String = ""
    var topicNumber: Int = 0
    var userAns:Int = 0
    var answered:Bool = false
    var currentQuestion:Int = 0
    var timer = Timer()
    let delay = 1.5
    var score:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadQuestion()
    }
    
    
    // MARK: OUTLETS
    
    @IBOutlet weak var questionLabel: UILabel!{
        didSet{
            questionLabel.layer.cornerRadius = questionLabel.frame.size.height / 20
            questionLabel.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var optionButtons: [UIButton]!
    
    
    // MARK: ACTIONS
    
    @IBAction func choseAnswer(_ sender: UIButton) {
        
        answered = true
        if sender == optionButtons[0]{
            userAns = 1
        }
        else if sender == optionButtons[1]{
            userAns = 2
        } else if sender == optionButtons[2]{
            userAns = 3
        }
        else{
            userAns = 4
        }
        
        if userAns == topic!.questions[currentQuestion].correctAns{
            score += 1
        }
        
        currentQuestion += 1
        setOptionColor(sender)
        
        timer.invalidate()
        disableButtons()
        nextQuestion()
    }
    
    
    // MARK : HELPER METHODS
    
    func setOptionColor(_ sender: UIButton){
        if answered == true {
            optionButtons[topic!.questions[currentQuestion-1].correctAns-1].backgroundColor = #colorLiteral(red: 0.4537969828, green: 0.7473406196, blue: 0.2674373388, alpha: 1)
            optionButtons[topic!.questions[currentQuestion-1].correctAns-1].setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            if userAns != topic!.questions[currentQuestion-1].correctAns{
                sender.backgroundColor = #colorLiteral(red: 0.9236522317, green: 0.2392916381, blue: 0.2136276364, alpha: 1)
                sender.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            }
        }
    }
    
    func nextQuestion(){
        if currentQuestion >= topic!.questions.count{
            timer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(endQuiz), userInfo: nil, repeats: false)
        }
        else {
            timer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(loadQuestion), userInfo: nil, repeats: false)
        }
    }
    
    func disableButtons(){
        for option in 0..<optionButtons.count{
            optionButtons[option].isEnabled = false
        }
    }
    
    func enableButtons(){
        for option in 0..<optionButtons.count{
            optionButtons[option].isEnabled = true
        }
    }
    
    func resetOptionColor(){
        for buttons in optionButtons{
            buttons.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            buttons.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        }
    }
    
    @objc func loadQuestion(){
        resetOptionColor()
        answered = false
        questionLabel.text = topic!.questions[currentQuestion].question
        for option in 0..<optionButtons.count{
            optionButtons[option].setTitle(topic?.questions[currentQuestion].options[option], for: .normal)
        }
        enableButtons()
    }
    
    private func setupUI(){
        view.setGradientBackground(colorOne: Colors.gradientColor1, colorTwo: Colors.gradientColor2)
        navigationItem.title = topicName
        
        for buttons in optionButtons{
            buttons.layer.cornerRadius = buttons.frame.size.height / 5
            buttons.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            buttons.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        }
    }
    
    
    //MARK : SEGUES
    
    @objc func endQuiz(){
        performSegue(withIdentifier: "showSummary", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? QuizSummaryViewController{
            destination.score = score
            destination.topic = topic
            destination.topicNumber = topicNumber
        }
    }
}
