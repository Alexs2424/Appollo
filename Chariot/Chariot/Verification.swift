//
//  Verification.swift
//  Chariot
//
//  Created by Alex Santarelli on 10/2/15.
//  Copyright © 2015 iInnovate. All rights reserved.
//

import Foundation
import UIKit

struct Verification {
    
    var urlLink: String
    var apiKey: String
    var username: String
    var password: String?
    
    init(urlLink: String, apikey: String, username: String) {
        self.urlLink = urlLink
        self.apiKey = apikey
        self.username = username
    }
    
    init(urlLink: String, apikey: String, username: String, password: String) {
        self.urlLink = urlLink
        self.apiKey = apikey
        self.username = username
        self.password = password
    }
    
    func requestVerificationData() -> (NSMutableURLRequest, NSString) {
        
        let url:NSURL = NSURL(string: self.urlLink)!
        
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url.standardizedURL!)
        
        request.HTTPMethod = "POST"
        
        let sendingData = NSString(format: "username=%@&password=%@&apikey=%@", self.username, (self.password)!, self.apiKey)
        
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.HTTPBody = sendingData.dataUsingEncoding(NSUTF8StringEncoding)
        
        return (request, sendingData)
    }
    
    func requestNameData() -> (NSMutableURLRequest, NSString) {
        let url:NSURL = NSURL(string: self.urlLink)!
        
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url.standardizedURL!)
        
        request.HTTPMethod = "POST"
        
        let sendingData = NSString(format: "username=%@&apikey=%@", self.username, self.apiKey)
        
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.HTTPBody = sendingData.dataUsingEncoding(NSUTF8StringEncoding)
        
        return (request, sendingData)
    }
    
}