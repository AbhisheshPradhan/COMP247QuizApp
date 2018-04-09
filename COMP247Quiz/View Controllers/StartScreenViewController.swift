//
//  ViewController.swift
//  COMP247Quiz
//
//  Created by Abhishesh Pradhan on 1/4/18.
//  Copyright © 2018 Abhishesh Pradhan. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    var topicList: [Topic] = []
    
    private func getJSON() {
        let path = Bundle.main.path(forResource: "questionBank", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do{
            let data = try Data.init(contentsOf: url)
            let quizData = try JSONDecoder().decode([Topic].self, from: data)
            DispatchQueue.main.async {
                self.topicList = quizData
            }
        }
        catch let jsonErr {
            print("error serializing json", jsonErr)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chooseTopics" {
            let destination = segue.destination as? ChooseTopicsViewController
            destination?.topicList = topicList
        } else if segue.identifier == "showProgress" {
            let destination = segue.destination as? ProgressViewController
            destination?.topicList = topicList
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getJSON()
    }
    
    
    //MARK : OUTLETS
    
    @IBOutlet weak var beginButton: UIButton!
    @IBOutlet weak var progressButton: UIButton!
    
    
    //MARK : UI Setup 
    
    private func setupUI(){
        view.setGradientBackground(colorOne: Colors.gradientColor1, colorTwo: Colors.gradientColor2)
        beginButton.layer.cornerRadius = beginButton.frame.size.height / 5
        beginButton.setTitle("Begin", for: .normal)
        beginButton.backgroundColor = #colorLiteral(red: 0.0479086861, green: 0.1120770648, blue: 0.1909584403, alpha: 1)
        
        progressButton.layer.cornerRadius = beginButton.frame.size.height / 5
        progressButton.backgroundColor = #colorLiteral(red: 0.0479086861, green: 0.1120770648, blue: 0.1909584403, alpha: 1)
        
    }
}

