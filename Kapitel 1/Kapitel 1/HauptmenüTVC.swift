//
//  HauptmenüTVC.swift
//  Kapitel 1
//
//  Created by Udemy on 27.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class Hauptmenu_TVC: UITableViewController {
    
    let daten = ["Synchroner Download", "Asynchroner Download", "JSON parsen", "XML parsen", "CoreLocation/MapKit", "Core Image", "Eigenes Delegate-Protokoll", "Facebook / Twitter", "Movieplayer", "Kontaktiere mich!"]

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daten.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        cell.textLabel?.text = daten[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var identifier = ""
        
        switch indexPath.row {
        case 0,1:
            identifier = "datenLaden"
        case 2:
            identifier = "jsonSegue"
        case 3:
            identifier = "xmlSegue"
        case 4:
            identifier = "clmkSegue"
        case 5:
            identifier = "ciSegue"
        case 6:
            identifier = "delegateSegue"
        case 7:
            identifier = "socialSegue"
        case 8:
            identifier = "movieSegue"
        case 9:
            identifier = "contactMeSegue"
        default:
            break
        }
        let senderCell = tableView.cellForRowAtIndexPath(indexPath)
        performSegueWithIdentifier(identifier, sender: senderCell)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let zielViewController = segue.destinationViewController as? a_synchronDatenLadenVC where segue.identifier == "datenLaden" {
            
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            let titel = daten[indexPath.row]
            zielViewController.titel = titel
            if indexPath.row == 1 {
                zielViewController.asynchron = true
            }
        }
    }


}
