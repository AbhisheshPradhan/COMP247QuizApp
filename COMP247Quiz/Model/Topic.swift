//
//  Topic.swift
//  COMP247Quiz
//
//  Created by Abhishesh Pradhan on 5/4/18.
//  Copyright © 2018 Abhishesh Pradhan. All rights reserved.
//

import Foundation

struct Topic: Decodable
{
    let topicName: String
    let questions: [Question]
 //   let topicList: [Topic]?
}
