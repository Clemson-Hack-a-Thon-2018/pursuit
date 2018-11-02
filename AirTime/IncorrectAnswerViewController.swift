//
//  IncorrectAnswerViewController.swift
//  AirTime
//
//  Created by Lincoln Fraley on 11/2/18.
//  Copyright © 2018 Dynepic, Inc. All rights reserved.
//

import Foundation
import UIKit

class IncorrectAnswerViewController: AnswerViewController {
    
    @IBOutlet weak var correctAnswerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctAnswerButton.setTitle(correctAnswer, for: .normal)
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        next(score: 0)
    }
}
