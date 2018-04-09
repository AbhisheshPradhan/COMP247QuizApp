//
//  ProgressViewController.swift
//  COMP247Quiz
//
//  Created by Abhishesh Pradhan on 9/4/18.
//  Copyright © 2018 Abhishesh Pradhan. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource
{
    
    var topicList: [Topic] = []
    var highScoreString: String = ""
    var topicNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
     //   newScoreFunc()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicList.count
    }
    
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customProgressCell") as! ProgressTableViewCell
        
        let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.integer(forKey: topicList[indexPath.row].topicName)
        cell.progressLabel.text = String(value) //+ "/50"
        cell.topicLabel.text = topicList[indexPath.row].topicName

        return cell
    }
}
