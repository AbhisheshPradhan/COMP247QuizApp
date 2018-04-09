//
//  ProgressTableViewCell.swift
//  COMP247Quiz
//
//  Created by Abhishesh Pradhan on 9/4/18.
//  Copyright © 2018 Abhishesh Pradhan. All rights reserved.
//

import UIKit

class ProgressTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    //MARK : OUTLETS
    
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
