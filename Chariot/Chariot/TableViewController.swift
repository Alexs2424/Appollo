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
        
        // Display flag image
        /*
        var initialThumbnail = UIImage(named: "question")
        cell.customFlag.image = initialThumbnail
        if let thumbnail = object?["flag"] as? PFFile {
            cell.customFlag.file = thumbnail
            cell.customFlag.loadInBackground()
        }
        */
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
