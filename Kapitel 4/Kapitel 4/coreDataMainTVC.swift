//
//  coreDataMainTVC.swift
//  Kapitel 4
//
//  Created by Udemy on 29.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class coreDataMainTVC: UITableViewController {
    
    var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
    var daten: [Person]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hinzufügen", style: .Plain, target: self, action: "addButtonPressed:")
        ladeDaten()
    }
    
    func addButtonPressed(sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Hinzufügen", message: "Was soll hinzugefügt werden?", preferredStyle: .Alert)
        
        alert.addTextFieldWithConfigurationHandler {
            textField in
            textField.placeholder = "Name"
        }
        alert.addAction(UIAlertAction(title: "Abbrechen", style: .Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Bestätigen", style: .Default) {
            action in
            let neuePerson = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: self.context) as Person
            neuePerson.name = (alert.textFields![0] as UITextField).text
            self.context.save(nil)
            self.ladeDaten()
            })
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    func ladeDaten() {
        let request = NSFetchRequest(entityName: "Person")
        daten = context.executeFetchRequest(request, error: nil) as [Person]
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daten.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        cell.textLabel?.text = daten[indexPath.row].name
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            context.deleteObject(daten[indexPath.row])
            ladeDaten()
        }
    }
    
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
        return "Löschen"
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("detailSegue", sender: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailSegue" {
            let zielVC = segue.destinationViewController as CoreDataDetailTVC
            zielVC.context = context
            let indexPath = sender as NSIndexPath
            zielVC.person = daten[indexPath.row]
        }
    }
    
}









