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
    
    @IBAction func IBAction(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "Please Enter Your Team Name Below", message: nil, preferredStyle: .alert)
        alert.addTextField()
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { [weak self] _ in
            guard let self = self else { return }
            let answer = alert.textFields![0]
            // show the alert
            
            print("You entered \(String(describing: answer.text))")
            
            
            
            // write to this user's private data
            let innerd = ["name": answer.text] as [String: Any]
 PPManager.sharedInstance.PPdatasvc.writeBucket( bucketName:PPManager.sharedInstance.PPusersvc.getMyDataStorageName(), key:"TeamInfo", value:innerd ) { succeeded, response, responseObject in
                if(!succeeded) {
                    print("write JSON error:")
                } else {
                    PPManager.sharedInstance.PPdatasvc.readBucket(bucketName: PPManager.sharedInstance.PPusersvc.getMyDataStorageName(), key: "TeamInfo", completion: { (succeeded, response, responseObject) in
                        if(succeeded) {
//                            print("response read:" \(responseObject) as Any )
                        }
                    })
                    
                }
            }
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        }
    }

/*
    }
    
   // @IBAction func settingsTapped(_ sender: UIBarButtonItem) {
        guard let settings = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Settings") as? SettingsTableTableViewController else {
            print()
            return
        }
//        settings.user = user
  //      present(settings, animated: true, completion: nil)
    }
    
    @IBAction func playPORTALTapped(_ sender: UIBarButtonItem) {
 //       Utils.openOrDownloadPlayPortal(delegate: self)
    }
    
  //  @objc func leaderboardTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        guard let leaderboard = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "leaderboardTableViewController") as? LeaderboardTableViewController else {
            return
        }
   //     present(leaderboard, animated: true, completion: nil)
    }
    
    func storeMyStatsToServer(completion: @escaping PPDataCompletion) {
        if let _:String = PPManager.sharedInstance.PPusersvc.user.uo.handle {
            _ = PPManager.sharedInstance.stringFromDate(date: Date())

 
            }
        
        }
    
    
    func storeRawDataToServer(jumpCount:Int, longestJump: Double, completion: @escaping PPDataCompletion) {
        /*
        let s:String = PPManager.sharedInstance.PPusersvc.user.uo.handle!
        let jc:NSNumber = jumpCount as NSNumber
        let lj: NSNumber = longestJump as NSNumber
        let tnow = PPManager.sharedInstance.stringFromDate(date: Date())
        let innerd = ["user": s, "jump count": jc, "longest jump":lj, "epoch": tnow] as [String: Any]
        PPManager.sharedInstance.PPdatasvc.writeBucket( bucketName:PPManager.sharedInstance.PPusersvc.getMyAppGlobalDataStorageName(), key:s, value:innerd) { succeeded, response, responseObject in
            if(!succeeded) { print("write JSON error:") }
        }
 */
    }

   
        
        
    
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("diddeactivate")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("didbecomeinactive")
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidCompleteWith")
    }

    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}
*/
