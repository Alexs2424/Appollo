//
//  FavoriteSessionsViewController.swift
//  Chariot
//
//  Created by Alex Santarelli on 10/2/15.
//  Copyright © 2015 iInnovate. All rights reserved.
//

import UIKit

class FavoriteSessionsViewController: UIViewController, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the insets of the table lower so it looks better
        //self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("FAV") == nil) {
            print("There shouldn't be any sessions favorited.")
            return
        }
        
        print("Trying to pick up items in the favorites array.")
        
        var favoritesArray:Array = NSUserDefaults.standardUserDefaults().objectForKey("FAV") as! Array<Dictionary<String, String>>
        
        let favoritesArrayCount = favoritesArray.count
        
        let firstObjectTitle = favoritesArray[0]["Title"]
        
        print("Favorites Array: \n \(favoritesArray)")
        print("Number of objects in the favorites array: \n \(favoritesArrayCount)")
        print("First Object Title: \n \(firstObjectTitle)")
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
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
