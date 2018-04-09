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
    
    var topicList: [Topic] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // MARK : TABLE VIEW OUTLET
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK : TABLE VIEW DELEGATES
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.cellLabel.text = topicList[indexPath.row].topicName
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showQuestion", sender: self)
    }
    
    
    //MARK : SEGUES
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? QuizViewController{
            destination.topic = topicList[(tableView.indexPathForSelectedRow?.row)!]
            let indexPath = tableView.indexPathForSelectedRow
            let currentCell = tableView.cellForRow(at: indexPath!) as! CustomTableViewCell
            //destination.topicName = (currentCell?.textLabel!.text!)!
            destination.topicName = currentCell.cellLabel.text!
        }
    }
}
