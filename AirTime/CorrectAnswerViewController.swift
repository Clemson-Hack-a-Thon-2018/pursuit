//
//  CorrectAnswerViewController.swift
//  AirTime
//
//  Created by Lincoln Fraley on 11/2/18.
//  Copyright © 2018 Dynepic, Inc. All rights reserved.
//

import Foundation
import UIKit

class CorrectAnswerViewController: AnswerViewController {
    
    @IBAction func nextTapped(_ sender: UIButton) {
        next(score: 1)
    }
}
