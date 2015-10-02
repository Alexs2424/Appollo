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
    
    
    
}