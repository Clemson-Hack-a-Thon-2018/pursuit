//
//  LoginViewController.swift
//  AirTime
//
//  Created by Gary J. Baldwin on 9/6/18.
//  Copyright © 2018 Dynepic, Inc. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var continueAsGuestButton: UIButton?
    @IBOutlet weak var loginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     

        //PPLoginButton handles all auth flow
        let loginButton = PPLoginButton.init()
        loginButton.center = CGPoint(x: loginView.bounds.size.width  / 2,
                                     y: loginView.bounds.size.height * (3 / 4))
        loginView.addSubview(loginButton)
    }
    
    @IBAction func continueAsGuestTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "Coming Soon!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
