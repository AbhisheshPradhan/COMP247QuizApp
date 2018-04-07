//
//  QuizViewController.swift
//  COMP247Quiz
//
//  Created by Abhishesh Pradhan on 4/4/18.
//  Copyright © 2018 Abhishesh Pradhan. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController
{
    
    var topic: Topic?
    var userAns:Int = 0
    var answered:Bool = false
    var currentQuestion:Int = 0
    var timer = Timer()
    let delay = 1.5
    var score:Int = 0
    
    
    // MARK: OUTLETS
    @IBOutlet weak var questionLabel: UILabel!{
        didSet{
            questionLabel.layer.cornerRadius = questionLabel.frame.size.height / 5
            questionLabel.layer.masksToBounds = true
        }
    }
    @IBOutlet var optionButtons: [UIButton]!
    
    // MARK: ACTIONS (Buttons)
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
    
    func setOptionColor(_ sender: UIButton){
        if answered == true {
            optionButtons[topic!.questions[currentQuestion-1].correctAns-1].backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            if userAns != topic!.questions[currentQuestion-1].correctAns{
                sender.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
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
    
    func showCorrectAns(_ sender: UIButton){
        sender.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
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
    
    @objc func loadQuestion(){
        resetOptionColor()
        answered = false
        questionLabel.text = topic!.questions[currentQuestion].question
        for option in 0..<optionButtons.count{
            
            optionButtons[option].setTitle(topic?.questions[currentQuestion].options[option], for: .normal)
        }
        enableButtons()
    }
    
    @objc func endQuiz(){
        performSegue(withIdentifier: "showSummary", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadQuestion()
    }
    
    func resetOptionColor(){
        for buttons in optionButtons{
            buttons.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    private func setupUI(){
        view.setGradientBackground(colorOne: Colors.gradientColor1, colorTwo: Colors.gradientColor2)
        //  navigationItem.title
        
        for buttons in optionButtons{
            buttons.layer.cornerRadius = buttons.frame.size.height / 5
            buttons.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            buttons.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            //  questionLabel.layer.cornerRadius = questionLabel.frame.height / 5
         
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? QuizSummaryViewController{
            destination.score = score
            destination.topic = topic
        }
    }
}
