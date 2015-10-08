//
//  FirstViewController.swift
//  Chariot
//
//  Created by Alex Santarelli on 9/28/15.
//  Copyright © 2015 iInnovate. All rights reserved.
//

import UIKit
import Parse


class FirstViewController: UIViewController {
    
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    var fullname = ""
    
    
    var chariotClass = Chariot()

    override func viewDidLoad() {
        super.viewDidLoad()
        if NSUserDefaults.standardUserDefaults().stringForKey("INTRO") == nil {
            return
        }
        //Taking the full name of the student
        fullname = NSUserDefaults.standardUserDefaults().stringForKey("FULLNAME")!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        if NSUserDefaults.standardUserDefaults().objectForKey("INTRO") == nil {
            //Go to the login view.
            let loginController = self.storyboard!.instantiateViewControllerWithIdentifier("intro") as! SignInViewController
            self.presentViewController(loginController, animated: true, completion: nil)
            print("User has not been signed in yet..")

        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func studentWorkArea(sender: AnyObject) {
        self.chariotClass.createPlaceParseObject("StudentWorkArea", studentUsername: fullname, whereLabel: self.placeLabel, timeLabel: self.timeLabel)
    }

    @IBAction func mrGrandi(sender: AnyObject) {
        self.chariotClass.createPlaceParseObject("Grandi", studentUsername: fullname, whereLabel: self.placeLabel, timeLabel: self.timeLabel)
    }
    
    @IBAction func mrWimmer(sender: AnyObject) {
        self.chariotClass.createPlaceParseObject("Wimmer", studentUsername: fullname, whereLabel: self.placeLabel, timeLabel: self.timeLabel)
    }
    
    @IBAction func library(sender: AnyObject) {
        self.chariotClass.createPlaceParseObject("Library", studentUsername: fullname, whereLabel: self.placeLabel, timeLabel: self.timeLabel)
    }
    
    @IBAction func mrWard(sender: AnyObject) {
        self.chariotClass.createPlaceParseObject("Ward", studentUsername: fullname, whereLabel: self.placeLabel, timeLabel: self.timeLabel)
    }
    
    @IBAction func downstairs600WorkArea(sender: AnyObject) {
        self.chariotClass.createPlaceParseObject("Downstairs", studentUsername: fullname, whereLabel: self.placeLabel, timeLabel: self.timeLabel)
    }
    
    
}

