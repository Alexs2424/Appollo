//
//  SignInViewController.swift
//  Chariot
//
//  Created by Alex Santarelli on 10/2/15.
//  Copyright © 2015 iInnovate. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, NSURLConnectionDataDelegate {
    
    //UI Outlets 
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    

    var verifyResponse = Verification(urlLink: "https://www.cypanthers.org/ios/auth.php",
                                      apikey: "dFCbdEVD8apyvMEX",
                                      username: "",
                                      password: "")
    
    var nameResponse = Verification(urlLink: "https://www.cypanthers.org/ios/names.php",
                                    apikey: "GwTDQaqPzKxqLypz",
                                    username: "17asantarelli")
    
    var recievedData:NSMutableData = NSMutableData()
    var connection:NSURLConnection = NSURLConnection()
    var verified = false
    var firstName = ""
    var lastName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Added Observer to look for the notification to state the second 
        //connection to receive name.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("verified:"), name:"verified", object: nil);
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*** CONNECTION DATA DELEGATE FUNCTIONS ***/

    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        print("Connection Recieved Data")
        self.recievedData.appendData(data)
        print("Data Received: \(self.recievedData)")
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        let responseString:NSString = NSString(data: self.recievedData, encoding: NSUTF8StringEncoding)!
        
        /*** VERIFICATION ONLY ***/
        if responseString.isEqualToString("1") {
            print("Student was verified")
            verified = true
            //Save the usernames and passwords
            NSNotificationCenter.defaultCenter().postNotificationName("verified", object: nil)
            //Show animations on the UI
            
            
            //ending the function so the name portion isnt called.
            return
        }
        else if responseString.isEqualToString("0") {
            print("Student was not verified")
            verified = false
            
            //returning the function so the name portion isnt called.
            return
        }
        
        /** VERIFICATION SECTION END **/
        print("**NAMES SECTION BEGIN**")
        let name = responseString
        print(name)
        let nameArray = name.componentsSeparatedByString(" ")
        firstName = nameArray[0]
        lastName = nameArray[1]
        NSUserDefaults.standardUserDefaults().setObject(firstName, forKey: "FIRSTNAME")
        NSUserDefaults.standardUserDefaults().setObject(lastName, forKey: "LASTNAME")
        self.welcomeLabel.text = NSString(format: "Welcome, %@!", firstName) as String
        

    }
    
    /*** SIGN IN BUTTON ***/
    @IBAction func signIn(sender: AnyObject) {
        
        verifyResponse.username = self.usernameField.text!
        verifyResponse.password = self.passwordField.text!
        nameResponse.username = self.usernameField.text!
        
        self.connection.cancel()
        
        let data = NSMutableData()
        
        self.recievedData = data
        
        let verificationResponse = verifyResponse.requestVerificationData()
        
        let connection:NSURLConnection = NSURLConnection(request: verificationResponse.0, delegate: self)!
        
        self.connection = connection
        
        connection.start()
    }
    
    /*** NSNotification Observer Function ***/
    
    func verified(sender: NSNotification) {
        print("Started Verification for names.")
        
        connection.cancel()
        
        let nameData = NSMutableData()
        
        self.recievedData = nameData
        
        let nameVerificationResponse = nameResponse.requestNameData()
        
        let nameConnection:NSURLConnection = NSURLConnection(request: nameVerificationResponse.0, delegate: self)!
        
        self.connection = nameConnection
    }
    
    //Keyboard Resign
    @IBAction func reisgnKeyboard(sender: AnyObject) {
        self.usernameField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
    }
    

}
