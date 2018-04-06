//
//  Question.swift
//  COMP247Quiz
//
//  Created by Abhishesh Pradhan on 4/4/18.
//  Copyright © 2018 Abhishesh Pradhan. All rights reserved.
//

import Foundation


struct Question: Decodable, Hashable
{

    public var question : String
    public let options : [String]
    private let correctAns : Int
    public  var userAns: Int?
    var answered : Bool?
    
    func isCorrect(_ userAns:Int) -> Bool{
        if userAns == correctAns{
            return true
        }
        else{
            return false
        }
    }
//
////    internal init(json: [String: JSON]) {
////        question = json["question"]?.string ?? ""
////        options = json["options"]?.arrayObject as? [String] ?? []
////        correctAns = json["correct_response"]?.int ?? 0
////    }

    // MARK: - Hashable

    public var hashValue: Int {
        return question.hashValue
    }

    public static func ==(lhs: Question, rhs: Question) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
