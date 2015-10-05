//
//  SignInViewController.swift
//  Chariot
//
//  Created by Alex Santarelli on 10/2/15.
//  Copyright © 2015 iInnovate. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, NSURLConnectionDataDelegate {

    var verifyResponse = Verification(urlLink: "https://www.cypanthers.org/ios/auth.php",
                                      apikey: "dFCbdEVD8apyvMEX",
                                      username: "17asantarelli",
                                      password: "94Estral")
    
    var nameResponse = Verification(urlLink: "https://www.cypanthers.org/ios/names.php",
                                    apikey: "GwTDQaqPzKxqLypz",
                                    username: "17asantarelli")
    
    var recievedData:NSMutableData = NSMutableData()
    var connection:NSURLConnection = NSURLConnection()
    var verified = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let name = responseString
        print(name)
        
    }
    
    /*** SIGN IN BUTTON ***/
    @IBAction func signIn(sender: AnyObject) {
        self.connection.cancel()
        
        let data = NSMutableData()
        
        self.recievedData = data
        
        let verificationResponse = verifyResponse.requestVerificationData()
        
        let connection:NSURLConnection = NSURLConnection(request: verificationResponse.0, delegate: self)!
        
        self.connection = connection
        
        connection.start()
        
        
        
    }
    

}
