//
//  AnswerViewController.swift
//  AirTime
//
//  Created by Lincoln Fraley on 11/2/18.
//  Copyright © 2018 Dynepic, Inc. All rights reserved.
//

import Foundation
import UIKit

class AnswerViewController: UIViewController {
    
    var questions = [Question]()
    var currentQuestion = 0
    var correctAnswer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func next(score: Int) {
        
        //  Write score
        
        let questions = self.questions
        let currentQuestion = self.currentQuestion
        
        PPManager.sharedInstance.PPdatasvc.readBucket(
            bucketName: PPManager.sharedInstance.PPusersvc.getMyDataStorageName(),
            key: "TeamInfo")
        { _, _, responseObject in
            guard let json = responseObject?["TeamInfo"] as? [String: Any]
                , var bucket = Bucket(from: json)
                else {
                    return
            }
            
            bucket.score += score
            bucket.currentQuestion = questions[currentQuestion].id
            bucket.scoreHistory.append([
                questions[currentQuestion].id: score
            ])
            
            print(bucket.toJSON)
            print()
            
            PPManager.sharedInstance.PPdatasvc.writeBucket(
                bucketName:PPManager.sharedInstance.PPusersvc.getMyDataStorageName(),
                key:"TeamInfo",
                value:bucket.toJSON) { _, _, _ in }
        }
        
        if currentQuestion + 1 >= questions.count {
            print()
        } else {
            guard let multiChoice = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "multiChoice") as? MultiChoiceQuestionViewController else {
                return
            }
            
            multiChoice.questions = questions
            multiChoice.currentQuestion = currentQuestion + 1
            
            present(multiChoice, animated: true, completion: nil)
        }
    }
}
