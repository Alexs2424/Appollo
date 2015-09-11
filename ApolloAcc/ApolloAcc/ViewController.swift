//
//  ViewController.swift
//  ApolloAcc
//
//  Created by Alex Santarelli on 9/10/15.
//  Copyright (c) 2015 iInnovate. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    var places = [""]
    
    //Buttons for Places
    @IBOutlet weak var studentWorkArea: UIButton!
    @IBOutlet weak var wimmer: UIButton!
    @IBOutlet weak var grandi: UIButton!
    @IBOutlet weak var ward: UIButton!
    @IBOutlet weak var hubLibrary: UIButton!
    
    let username = NSUserDefaults.standardUserDefaults().valueForKey("USERNAME") as! String

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting up the cosmetics of the view
        self.studentWorkArea.layer.cornerRadius = 10
        self.wimmer.layer.cornerRadius = 10
        self.grandi.layer.cornerRadius = 10
        self.ward.layer.cornerRadius = 10
        self.hubLibrary.layer.cornerRadius = 10
        
        var queryForPlaces = PFQuery(className: "Places")
        queryForPlaces.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved Places Object.")
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        println(object.objectId)
                    }
                }
            } else {
                // Log details of the failure
                println("Error: \(error!)")
            }
        }
        
        
    }
    
    //View Did Appear for the login screen
    override func viewDidAppear(animated: Bool) {
        if NSUserDefaults.standardUserDefaults().valueForKey("INTRO") == nil {
            let introController = self.storyboard!.instantiateViewControllerWithIdentifier("intro") as! LoginViewController
            self.presentViewController(introController, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signInLocation(place: String) {
        
        //Creating the NSDateFormat with the current time
        var time:NSDateFormatter = NSDateFormatter()
        time.timeStyle = NSDateFormatterStyle.ShortStyle
        
        var timeString = time.stringFromDate(NSDate())
        println(time)
        
        var place = PFObject(className: "Place")
        place.setValue(place, forKey: "Place")
        place.setValue(timeString, forKey: "TimeSigned")
        place.setValue(username, forKey: "Student")
        place.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
    }
    
    //Buttons for the places
    @IBAction func studentWorkArea(sender: AnyObject) {
        self.signInLocation(places[0])
    }
    
    @IBAction func wimmer(sender: AnyObject) {
        self.signInLocation(places[1])
    }
    
    @IBAction func grandi(sender: AnyObject) {
        self.signInLocation(places[2])
    }

    @IBAction func ward(sender: AnyObject) {
        self.signInLocation(places[3])
    }
    
    @IBAction func hubLibrary(sender: AnyObject) {
        self.signInLocation(places[4])
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

