//
//  ViewController.swift
//  SocialTLogin
//
//  Created by Apple on 11/26/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func twitterLoginClicked(_ sender: Any) {
        
        TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
            if (session != nil) {
                
                let client = TWTRAPIClient(userID: session!.userID)
                
                client.loadUser(withID: (session?.userID)!) { user, error in
                    print("session user id \(String(describing: session?.userID))")
                    print("session user name \(String(describing: session?.userName))")
                    print("session user name \(String(describing: user?.name))")
                    print("session user profile image \(String(describing: user?.profileImageURL))")
                    print("session user auth token secret \(String(describing: session?.authTokenSecret))")
                }
            } else {
                print(error?.localizedDescription as Any)
            }
        })
        
        
    }
    
}

