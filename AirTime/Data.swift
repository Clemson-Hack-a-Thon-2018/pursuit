//
//  Data.swift
//  AirTime
//
//  Created by Audra Lynn on 11/1/18.
//  Copyright © 2018 Dynepic, Inc. All rights reserved.
//

import Foundation

struct Bucket {
    
    var name: String
    var currentQuestion: String
    var score: Int
    var scoreHistory: [[String: Int]]
    
    var toJSON: [String: Any] {
        get {
            return [
                "name": name,
                "currentQuestion": currentQuestion,
                "score": score,
                "scoreHistory": scoreHistory
            ]
        }
    }
    
    init(
        name: String,
        currentQuestion: String = "",
        score: Int = 0,
        scoreHistory: [[String: Int]] = [])
    {
        self.name = name
        self.currentQuestion = currentQuestion
        self.score = score
        self.scoreHistory = scoreHistory
    }
    
    init?(from json: [String: Any]) {
        guard let name = json["name"] as? String
            , let currentQuestion = json["currentQuestion"] as? String
            , let score = json["score"] as? Int
            , let scoreHistory = json["scoreHistory"] as? [[String: Int]]
            else {
                return nil
        }
        
        self.init(name: name, currentQuestion: currentQuestion, score: score, scoreHistory: scoreHistory)
    }
    
    
}

struct Question {
    
    let id: String
    let question: String
    let answers: [String]
    let correctAnswer: String
    
    init?(from json: [String: Any]) {
        guard let id = json["id"] as? String
            , let question = json["question"] as? String
            , let answers = json["answers"] as? [String]
            , let correctAnswer = json["correctAnswer"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}

let jsonArray: [[String: Any]] = [
    [
        "id": "question1",
        "question": "Jimmy Byrnes served as all of these positions except:",
        "answers": [
            "Associate Supreme Justice",
            "Governor of SC",
            "Clemson Student Body President",
            "UN Ambassador"
        ],
        "correctAnswer": "Clemson Student Body President"
    ],
    [
        "id": "question2",
        "question": "One of Thomas Green Clemson’s favorite worldly possessions was a  Windsor chair formerly owned by which US president?",
        "answers": [
            "George Washington",
            "Abe Lincoln",
            "Thomas Jefferson",
            "Benjamin Franklin"
        ],
        "correctAnswer": "George Washington"
    ],
    [
        "id": "question3",
        "question": "In 1977 this ACC team refused to play the Clemson Football team. In response, Clemson students stamped tiger paws onto 2 dollar bills as a way to encourage continuing the competition. Which team refused to play Clemson?",
        "answers": [
            "Virginia",
            "North Carolina",
            "Georgia Tech",
            "NC State"
        ],
        "correctAnswer": "Georgia Tech"
    ]
]

let questions = jsonArray.compactMap { Question(from: $0) }
