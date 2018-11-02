//
//  HomeViewController.swift
//  AirTime
//
//  Created by Jett Black on 9/7/18.
//  Copyright © 2018 Dynepic, Inc. All rights reserved.
//

import UIKit
import WatchConnectivity
import StoreKit


class Stats : Codable {
    var totalJumps: Int!
    var totalJumpAttempts: Int!
    var maxSingleJumpCount:Int!
    var maxSingleHangTime:Double!
}
    

class HomeViewController: UIViewController, SKStoreProductViewControllerDelegate {
   
    
    @IBOutlet weak var teamLabel: UILabel!
    
    var teamName: String?
    
    var user: PPUserObject!
    
    @IBAction func goTapped(_ sender: UIButton) {
        guard let teamName = teamName, !teamName.isEmpty else {
            let alert = UIAlertController(title: "Hold up!", message: "You must enter a team name before starting!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            return
        }
        guard let multiChoice = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "multiChoice") as? MultiChoiceQuestionViewController else {
            return
        }
        multiChoice.questions = questions.shuffled()
        multiChoice.currentQuestion = 0
        present(multiChoice, animated: true, completion: nil)
    }
    
    @IBAction func IBAction(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "Please Enter Your Team Name Below", message: nil, preferredStyle: .alert)
        alert.addTextField()
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { [weak self] _ in
            guard let self = self
                , let answer = alert.textFields?[0].text
                else {
                    return
            }
            self.teamName = answer
        
            // write to this user's private data
            let bucket = Bucket(name: answer)
            PPManager.sharedInstance.PPdatasvc.writeBucket(
                bucketName:PPManager.sharedInstance.PPusersvc.getMyDataStorageName(),
                key:"TeamInfo",
                value:bucket.toJSON) { _, _, _ in
            }
            
            PPManager.sharedInstance.PPdatasvc.readBucket(
                bucketName: PPManager.sharedInstance.PPusersvc.getMyAppGlobalDataStorageName(),
                key: "UserToTeam")
            { _, _, response in
                guard var bucket = response?["UserToTeam"] as? [String: Any] else { return }
                bucket[self.user.uo.handle] = answer
                PPManager.sharedInstance.PPdatasvc.writeBucket(
                    bucketName: PPManager.sharedInstance.PPusersvc.getMyAppGlobalDataStorageName(),
                    key: "UserToTeam",
                    value: bucket) { _, _, _ in }
            }
            
            guard let multiChoice = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "multiChoice") as? MultiChoiceQuestionViewController else {
                return
            }
            multiChoice.questions = questions.shuffled()
            multiChoice.currentQuestion = 0
            self.present(multiChoice, animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        }
    }
