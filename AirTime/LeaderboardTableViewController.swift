//
//  LeaderboardTableViewController.swift
//  AirTime
//
//  Created by Lincoln Fraley on 11/2/18.
//  Copyright © 2018 Dynepic, Inc. All rights reserved.
//

import Foundation
import UIKit

class LeaderboardTableViewController: UITableViewController {
    
    var leaderboards = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        let s = PPLeaderboardService()
        s.getLeaderboard(page: 1, limit: 5, categories: "") { _, _, responseObject in
            guard let json = responseObject as? [String: Any]
                , let leaderboards = json["docs"] as? [[String: Any]]
                else {
                    return
            }
            PPManager.sharedInstance.PPdatasvc.readBucket(
                bucketName: PPManager.sharedInstance.PPusersvc.getMyAppGlobalDataStorageName(),
                key: "UserToTeam") { [weak self] _, _, responseObject in
                    guard let self = self
                        , let json = responseObject as? [String: Any]
                        , let bucket = json["UserToTeam"] as? [String: String]
                        else {
                            return
                    }
                    self.leaderboards = leaderboards.map { l in
                        var _l = l
                        for (handle, team) in bucket {
                            if let user = _l["user"] as? [String: Any]
                            , let h = user["handle"] as? String
                                , h == handle {
                                _l["team"] = team
                            }
                           
                        }
                        return _l
                    }
                    self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(5, leaderboards.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "leaderboardTableViewCell", for: indexPath) as? LeaderboardTableViewCell else {
            return UITableViewCell()
        }
        
        let leaderboard = leaderboards[indexPath.row]
        
        guard let rank = leaderboard["rank"] as? Int
            , let score = leaderboard["score"] as? Int
            , let team = leaderboard["team"] as? String
            else {
                return UITableViewCell()
        }
        
        cell.rankLabel.text = String(rank)
        cell.scoreLabel.text = String(score)
        cell.handleLabel.text = String(team)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
