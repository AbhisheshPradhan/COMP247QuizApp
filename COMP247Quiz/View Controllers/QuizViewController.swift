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
    //  var questions = [Question]()
    //  var answered:Bool = false
    //  var question: Question?
    var currentQuestion:Int = 0
    //    var i:Int = 0
    //   var initial:Bool = true
    
    var timer = Timer()
    let delay = 1.5
    
    
    // MARK: Outlets
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var optionButtons: [UIButton]!
    
    //    @IBAction func option1(_ sender: UIButton) {
    ////                if topic?.questions[0].isCorrect(1) == true{
    ////                    print("correct")
    ////                }
    ////                else {
    ////                    print("wrong")
    ////                }
    //    }
    //    @IBAction func option2(_ sender: UIButton) {
    ////                if topic?.questions[0].isCorrect(2) == true{
    ////                    print("correct")
    ////                }
    ////                else {
    ////                    print("wrong")
    ////                }
    //    }
    //    @IBAction func option3(_ sender: UIButton) {
    ////                if topic?.questions[0].isCorrect(3) == true{
    ////                    print("correct")
    ////                }
    ////                else {
    ////                    print("wrong")
    ////                }
    //
    //    }
    //
    //    @IBAction func option4(_ sender: UIButton) {
    ////                if topic?.questions[0].isCorrect(4) == true{
    ////                    print("correct")
    ////                }
    ////                else {
    ////                    print("wrong")
    ////                }
    //    }
    @IBAction func choseAnswer(_ sender: UIButton) {
        
        timer.invalidate()
        currentQuestion += 1
        print("\(currentQuestion)")
        disableButtons()
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

    @objc func loadQuestion(){
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
    
    private func setupUI(){
        view.setGradientBackground(colorOne: Colors.gradientColor1, colorTwo: Colors.gradientColor2)
      //  navigationItem.title 
        
        for buttons in optionButtons{
            buttons.layer.cornerRadius = buttons.frame.size.height / 5
            buttons.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            buttons.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            //  questionLabel.layer.cornerRadius = questionLabel.frame.height / 5
            questionLabel.layer.cornerRadius = questionLabel.frame.size.height / 5
            questionLabel.layer.masksToBounds = true
        }
    }
}
