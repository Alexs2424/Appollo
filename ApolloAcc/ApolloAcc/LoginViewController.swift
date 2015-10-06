//
//  LoginViewController.swift
//  ApolloAcc
//
//  Created by Alex Santarelli on 9/10/15.
//  Copyright (c) 2015 iInnovate. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, NSURLConnectionDataDelegate {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var correct: UIImageView!
    
    var recievedData:NSMutableData = NSMutableData()
    var connection:NSURLConnection = NSURLConnection()
    var verified = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginButton.layer.cornerRadius = 10
        self.continueButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func keyboardResign(sender: AnyObject) {
        self.usernameField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
    }
    
    func studentVerification(username: String, password: String) {
        //var username = self.usernameField.text
        //var password = self.passwordField.text
        
        //If there is a connection, it needs cancelled
        //connection.cancel()
        self.connection.cancel()
        
        //initalize new mutable data
        var data = NSMutableData()
        self.recievedData = data
        
        //creating an NSURL with the target location we need
        var url:NSURL = NSURL(string: "https://www.cypanthers.org/ios/auth.php")!
        
        var request:NSMutableURLRequest =  NSMutableURLRequest(URL:url.standardizedURL!)
        
        request.HTTPMethod = "POST"
        
        var sendingData = NSString(format: "username=%@&password=%@&apikey=dFCbdEVD8apyvMEX", username, password)
        
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.HTTPBody = sendingData.dataUsingEncoding(NSUTF8StringEncoding)
        
        var connection:NSURLConnection =  NSURLConnection(request: request, delegate: self)!
        
        self.connection = connection
        
        connection.start()
    }

    /*
    NSURLCONNECTION DELEGATE FUNCTIONS
    */
    
    //Did receive data
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        println("connection recieved data")
        self.recievedData.appendData(data)
        println("recieved data \(self.recievedData)")
    }
    
    //Connection finished loading
    func connectionDidFinishLoading(connection: NSURLConnection) {
        var responseString:NSString = NSString(data: self.recievedData, encoding: NSUTF8StringEncoding)!

        //Student is verified with a 1 Response
        if responseString.isEqualToString("1") {
            println("Student was verified.")
            verified = true
            NSUserDefaults.standardUserDefaults().setValue(self.usernameField.text, forKey: "USERNAME")
            NSUserDefaults.standardUserDefaults().setValue(self.passwordField.text, forKey: "PASSWORD")
            NSUserDefaults.standardUserDefaults().setValue("SEEN", forKey: "INTRO")
            NSUserDefaults.standardUserDefaults().synchronize()

            UIView.animateWithDuration(0.8, animations: {
                self.usernameLabel.alpha = 0.0
                self.usernameField.alpha = 0.0
                self.passwordLabel.alpha = 0.0
                self.passwordField.alpha = 0.0
                self.loginButton.alpha = 0.0
                self.continueButton.alpha = 1.0
                self.correct.alpha = 1.0

            })
            self.titleLabel.text = "Please Tap Continue"
            
        } else {
            print("Incorrect username or password.")
            verified = false
            self.titleLabel.text = "Incorrect username or password."
        }
    }
    
    @IBAction func login(sender: AnyObject) {
        self.studentVerification(self.usernameField.text, password: self.passwordField.text!)        if verified {
            pprint"Login was successful!")
        } else {
            pprint"Login was unsuccessful.")
        }
    }
    
    @IBAction func continueButton(sender: AnyObject) {
        //This will take them to the home screen.
        let homeController = self.storyboard!.instantiateViewControllerWithIdentifier("home") as! ViewController
        self.presentViewController(homeController, animated: true, completion: nil)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

}
