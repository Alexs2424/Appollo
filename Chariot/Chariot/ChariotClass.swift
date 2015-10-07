//
//  ChariotClass.swift
//  Chariot
//
//  Created by Alex Santarelli on 9/30/15.
//  Copyright © 2015 iInnovate. All rights reserved.
//

import Foundation
import Parse

class Chariot {
    func formatPlace(parseFormat: String) -> String {
        switch parseFormat {
        case "StudentWorkArea":
            return "Student Work Area"
        case "Grandi":
            return "Mr.Grandi"
        case "Ward":
            return "Mr.Ward"
        case "Wimmer":
            return "Mr.Wimmer"
        case "Downstairs":
            return "Downstairs 600 Work Area"
        case "Library":
            return "Library"
        default:
            return "Place is not listed."
        }
    }
    
    func createPlaceParseObject(place: String, studentUsername: String, whereLabel: UILabel, timeLabel: UILabel) {
        
        //Setting a Place Format String, so it looks nice.
        var placeFormatString = ""
        
        //Creating the time signature
        let time:NSDateFormatter = NSDateFormatter()
        time.timeStyle = NSDateFormatterStyle.ShortStyle
        let timeString  = time.stringFromDate(NSDate())
        
        //Running a switch so the label when set, will look like it's supposed to.
        placeFormatString = self.formatPlace(place)
        
        //Setting the labels on the homescreen for where
        //the student is and the current time
        whereLabel.text = placeFormatString
        timeLabel.text = timeString
        
        //Creating the Parse Object for Place
        let placeObject = PFObject(className: "Place")
        placeObject["Area"] = place
        placeObject["Student"] = studentUsername
        placeObject["Time"] = timeString
        placeObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Place Object Created.")
        }
    }
    
    /***** ANIMATION FUNCTIONS *****/
    
    func fadeAnimateUILabel(label: UILabel, duration: NSTimeInterval, alpha: CGFloat) {
        UIView.animateWithDuration(duration, animations: {
            label.alpha = alpha
        })
    }
    
    func fadeAnimateUITextField(field: UITextField, duration:NSTimeInterval, alpha: CGFloat) {
        UIView.animateWithDuration(duration, animations: {
            field.alpha = alpha
        })
    }
    
    func fadeAnimateUIImageView(imageView: UIImageView, duration:NSTimeInterval, alpha: CGFloat) {
        UIView.animateWithDuration(duration, animations: {
            imageView.alpha = alpha
        })
    }
    
    func fadeAnimateUIButton(button: UIButton, duration: NSTimeInterval, alpha: CGFloat) {
        UIView.animateWithDuration(duration, animations: {
            button.alpha = alpha
        })
    }
    
}
