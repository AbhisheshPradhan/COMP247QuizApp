//
//  ChooseTopicsViewController.swift
//  COMP247Quiz
//
//  Created by Abhishesh Pradhan on 1/4/18.
//  Copyright © 2018 Abhishesh Pradhan. All rights reserved.
//

import Foundation
import UIKit


class ChooseTopicsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    //   var topics: Topic?
    var topicList: [Topic] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        getJSON()   
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = topicList[indexPath.row].topicName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showQuestion", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? QuizViewController{
            destination.topic = topicList[(tableView.indexPathForSelectedRow?.row)!]
            let indexPath = tableView.indexPathForSelectedRow //optional, to get from any UIButton for example
            let currentCell = tableView.cellForRow(at: indexPath!)
            destination.topicName = (currentCell?.textLabel!.text!)!
        }
    }
    
    public func getJSON() {
        let path = Bundle.main.path(forResource: "questionBank", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do{
            let data = try Data.init(contentsOf: url)
            let quizData = try JSONDecoder().decode([Topic].self, from: data)
            //try JSONDecoder().decode([Topic].self, from: data)
            DispatchQueue.main.async {
                self.topicList = quizData
                self.tableView.reloadData()
            }
        }
        catch let jsonErr {
            print("error serializing json", jsonErr)
        }
    }

    private func setupUI(){
        view.setGradientBackground(colorOne: Colors.gradientColor1, colorTwo: Colors.gradientColor2)
        //  beginButton.layer.cornerRadius = beginButton.frame.size.height / 5
        //beginButton.setTitle("", for: .normal)
    }
}
