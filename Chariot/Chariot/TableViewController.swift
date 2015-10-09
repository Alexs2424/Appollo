//
//  TableViewController.swift
//  Chariot
//
//  Created by Alex Santarelli on 10/9/15.
//  Copyright © 2015 iInnovate. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class TableViewController: PFQueryTableViewController {
    
    var teacher:NSString = ""
    
    
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        // Configure the PFQueryTableView
        self.parseClassName = "Sessions"
        self.textKey = "Title"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    override func queryForTable() -> PFQuery{
        var query = PFQuery(className: "Sessions")
        query.orderByAscending("Title")
        return query
    }
    
    
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CustomCell!
        if cell == nil {
            cell = CustomCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let sessionTitle = object?["Title"] as? String {
            cell.sessionTitle.text = sessionTitle
        }
        if let sessionTime = object?["Time"] as? String {
            cell.sessionTime.text = sessionTime
        }
        
        if let sessionTeacher = object?["Teacher"] as? NSString {
            teacher = sessionTeacher
        }
        
        
        /* CHECKING WHICH TEACHER IS WHICH
        TO ASSIGN THE IMEAGES TO EACH ONE. */
        
        
        if teacher.isEqualToString("Wimmer") {
            let wimmerImage = UIImage(named: "Wimmer Star")!
            cell.sessionStar.image = wimmerImage
        } else if teacher.isEqualToString("Grandi") {
            let grandiImage = UIImage(named: "Grandi Star")!
            cell.sessionStar.image = grandiImage
        } else {
            let wardImage = UIImage(named: "Ward Star")!
            cell.sessionStar.image = wardImage
        }

        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
