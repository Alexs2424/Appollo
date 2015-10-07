//
//  HomeTabViewController.swift
//  Chariot
//
//  Created by Alex Santarelli on 10/7/15.
//  Copyright © 2015 iInnovate. All rights reserved.
//

import UIKit

class HomeTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().stringForKey("INTRO") == nil {
            let introViewController = self.storyboard!.instantiateViewControllerWithIdentifier("intro") as! SignInViewController
            self.presentViewController(introViewController, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
