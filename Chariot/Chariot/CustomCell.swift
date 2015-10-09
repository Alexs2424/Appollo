//
//  CustomCell.swift
//  Chariot
//
//  Created by Alex Santarelli on 10/9/15.
//  Copyright © 2015 iInnovate. All rights reserved.
//

import Foundation
import UIKit
import Parse
import ParseUI

class CustomCell : PFTableViewCell {
    @IBOutlet weak var sessionTitle: UILabel!
    @IBOutlet weak var sessionTime: UILabel!
    @IBOutlet weak var sessionDescription: UITextView!
}