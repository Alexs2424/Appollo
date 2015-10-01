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
    
    
    //temporary for testing
    var myUsername = "17asantarelli"
    
    var chariotClass = Chariot()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func studentWorkArea(sender: AnyObject) {
        self.chariotClass.createPlaceParseObject("StudentWorkArea", studentUsername: myUsername, whereLabel: self.placeLabel, timeLabel: self.timeLabel)
    }

    @IBAction func mrGrandi(sender: AnyObject) {
        self.chariotClass.createPlaceParseObject("Grandi", studentUsername: myUsername, whereLabel: self.placeLabel, timeLabel: self.timeLabel)
    }
    
    @IBAction func mrWimmer(sender: AnyObject) {
        self.chariotClass.createPlaceParseObject("Wimmer", studentUsername: myUsername, whereLabel: self.placeLabel, timeLabel: self.timeLabel)
    }
    
    @IBAction func library(sender: AnyObject) {
        self.chariotClass.createPlaceParseObject("Library", studentUsername: myUsername, whereLabel: self.placeLabel, timeLabel: self.timeLabel)
    }
    
    @IBAction func mrWard(sender: AnyObject) {
        self.chariotClass.createPlaceParseObject("Ward", studentUsername: myUsername, whereLabel: self.placeLabel, timeLabel: self.timeLabel)
    }
    
    @IBAction func downstairs600WorkArea(sender: AnyObject) {
        self.chariotClass.createPlaceParseObject("Downstairs", studentUsername: myUsername, whereLabel: self.placeLabel, timeLabel: self.timeLabel)
    }
    
    
}

