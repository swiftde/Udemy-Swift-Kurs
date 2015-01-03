//
//  mainTVC.swift
//  Kapitel 4
//
//  Created by Udemy on 29.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class mainTVC: UITableViewController {

    let daten = ["NSUserDefaults", "CSV", "JSON", "CoreData", "Touch ID", "Notification Center Widget", "Custom Keyboard Extension"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daten.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        cell.textLabel?.text = daten[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(daten[indexPath.row], sender: nil)
    }
}














