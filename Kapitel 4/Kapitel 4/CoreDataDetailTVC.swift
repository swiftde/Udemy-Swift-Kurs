//
//  CoreDataDetailTVC.swift
//  Kapitel 4
//
//  Created by Udemy on 29.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class CoreDataDetailTVC: UITableViewController {

    var person: Person!
    var context: NSManagedObjectContext!
    var daten = [Buch]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hinzufügen", style: .Plain, target: self, action: "addButtonPressed:")
        
        ladeDaten()
    }
    
    func ladeDaten() {
        let request = NSFetchRequest(entityName: "Buch")
        request.predicate = NSPredicate(format: "person = %@", person)
        daten = context.executeFetchRequest(request, error: nil) as [Buch]
        tableView.reloadData()
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
            let neuesBuch = NSEntityDescription.insertNewObjectForEntityForName("Buch", inManagedObjectContext: self.context) as Buch
            neuesBuch.titel = (alert.textFields![0] as UITextField).text
            neuesBuch.person = self.person
            self.context.save(nil)
            self.ladeDaten()
            })
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daten.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        cell.textLabel?.text = daten[indexPath.row].titel
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
    
    
}
















