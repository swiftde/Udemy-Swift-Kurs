//
//  jsonTVC.swift
//  Kapitel 4
//
//  Created by Udemy on 29.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class jsonTVC: UITableViewController {

    var daten = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ladeDaten()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hinzufügen", style: .Plain, target: self, action: "addButtonPressed:")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        speicherDaten()
    }
    
    func addButtonPressed(sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Hinzufügen", message: "Was soll hinzugefügt werden?", preferredStyle: .Alert)
        
        alert.addTextFieldWithConfigurationHandler {
            textField in
            textField.placeholder = "Name"
        }
        alert.addTextFieldWithConfigurationHandler {
            textField in
            textField.placeholder = "Beschreibung"
        }
        alert.addAction(UIAlertAction(title: "Abbrechen", style: .Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Bestätigen", style: .Default) {
            action in
            let dictionary = ["name": (alert.textFields?[0] as UITextField).text!,
                "beschreibung": (alert.textFields?[1] as UITextField).text!]
            self.daten.append(dictionary)
            self.tableView.reloadData()
            })
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daten.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        let name = daten[indexPath.row]["name"]!
        let beschreibung = daten[indexPath.row]["beschreibung"]!
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = beschreibung
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            daten.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
        return "Löschen"
    }
    
    func ladeDaten() {
        let dirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as [String]
        let dir = dirs.first!
        let path = dir.stringByAppendingPathComponent("daten.json")
        
        let dataFromPath = NSData(contentsOfFile: path)
        
        if let data = dataFromPath {
            
            daten = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as [[String:String]]
            tableView.reloadData()
            
        }
    }
    
    func speicherDaten() {
        let dirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as [String]
        let dir = dirs.first!
        let path = dir.stringByAppendingPathComponent("daten.json")
        
        var data = NSJSONSerialization.dataWithJSONObject(daten, options: .PrettyPrinted, error: nil)
        data?.writeToFile(path, atomically: true)
    }
    
}










