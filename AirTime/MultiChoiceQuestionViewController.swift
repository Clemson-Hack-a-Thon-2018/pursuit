//
//  MultiChoiceQuestionViewController.swift
//  AirTime
//
//  Created by Lincoln Fraley on 11/2/18.
//  Copyright © 2018 Dynepic, Inc. All rights reserved.
//

import Foundation
import UIKit

class MultiChoiceQuestionViewController: UIViewController {
    
    @IBOutlet weak var questionButton: UIButton!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    var questions = [Question]()
    var currentQuestion = 0
    var shuffled = [String]()
    
    var question: Question {
        get { return questions[currentQuestion] }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionButton.isUserInteractionEnabled = false
        
        questionButton.setTitle(question.question, for: .normal)
        
        //  Hold reference to this so you can get correct indices later
        shuffled = question.answers.shuffled()
        
        for (answer, button) in zip(shuffled, [answer1Button, answer2Button, answer3Button, answer4Button]) {
            button?.setTitle(answer, for: .normal)
        }
    }
    
    @IBAction func question1Tapped(_ sender: UIButton) {
        questionTapped(answer: shuffled[0])
    }
    
    @IBAction func question2Tapped(_ sender: UIButton) {
        questionTapped(answer: shuffled[1])
    }
    
    @IBAction func question3Tapped(_ sender: UIButton) {
        questionTapped(answer: shuffled[2])
    }
    
    @IBAction func question4Tapped(_ sender: UIButton) {
        questionTapped(answer: shuffled[3])
    }
    
    func questionTapped(answer: String) {
     
        let id = answer == question.correctAnswer ? "correct" : "incorrect"
        guard let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id) as? AnswerViewController else {
            return
        }
        
        vc.questions = questions
        vc.currentQuestion = currentQuestion
        vc.correctAnswer = question.correctAnswer
        
        present(vc, animated: true, completion: nil)
    }
}
