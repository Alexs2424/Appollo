//
//  SignInViewController.swift
//  Chariot
//
//  Created by Alex Santarelli on 10/2/15.
//  Copyright © 2015 iInnovate. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    var verifyResponse = Verification(urlLink: "",
                                      apikey: "",
                                      username: NSUserDefaults.standardUserDefaults().objectForKey("USERNAME") as! String,
                                      password: NSUserDefaults.standardUserDefaults().objectForKey("PASSWORD") as! String)
    
    var nameResponse = Verification(urlLink: "",
                                    apikey: "",
                                    username: NSUserDefaults.standardUserDefaults().objectForKey("USERNAME") as! String)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
