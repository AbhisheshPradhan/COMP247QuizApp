//
//  CustomTableViewCell.swift
//  COMP247Quiz
//
//  Created by Abhishesh Pradhan on 9/4/18.
//  Copyright © 2018 Abhishesh Pradhan. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    // MARK : OUTLETS
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
