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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = daten[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var identifier = ""
        if indexPath.row == 0 || indexPath.row == 1 {
            identifier = "datenLaden"
        }
        else if indexPath.row == 2 {
            identifier = "jsonSegue"
        }
        else if indexPath.row == 3 {
            identifier = "xmlSegue"
        }
        else if indexPath.row == 4 {
            identifier = "clmkSegue"
        }
        else if indexPath.row == 5 {
            identifier = "ciSegue"
        }
        else if indexPath.row == 6 {
            identifier = "delegateSegue"
        }
        else if indexPath.row == 7 {
            identifier = "socialSegue"
        }
        else if indexPath.row == 8 {
            identifier = "movieSegue"
        }
        else if indexPath.row == 9 {
            identifier = "contactMeSegue"
        }
        let senderCell = tableView.cellForRowAtIndexPath(indexPath)
        performSegueWithIdentifier(identifier, sender: senderCell)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "datenLaden" {
            var zielViewController = segue.destinationViewController as a_synchronDatenLadenVC
            let indexPath = tableView.indexPathForCell(sender as UITableViewCell)!
            let titel = daten[indexPath.row]
            zielViewController.titel = titel
            if indexPath.row == 1 {
                zielViewController.asynchron = true
            }
        }
    }


}
