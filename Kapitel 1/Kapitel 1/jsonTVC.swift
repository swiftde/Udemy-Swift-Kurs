//
//  jsonTVC.swift
//  Kapitel 1
//
//  Created by Udemy on 27.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class jsonTVC: UITableViewController {
    
    var daten = [App]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ladeDaten()
    }
    
    func ladeDaten() {
        var json = [String: AnyObject]()
        let URL = NSURL(string: "https://itunes.apple.com/search?country=DE&term=Apple&media=software&limit=20")!
        let request = NSURLRequest(URL: URL)
        
        NSURLSession.sharedSession().dataTaskWithRequest(request) {
            [weak self] data, _, error in
            
            if let e = error {
                print("Fehler.. (\(e))")
                return
            }
            
            do {
                json = try (NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)) as! [String: AnyObject]
            } catch {
                print("Fehler in den json Daten!")
                return
            }
            
            let results = json["results"] as! [[String: AnyObject]]
            for dic in results {
                let name = dic["trackCensoredName"] as! String
                let version = dic["version"] as! String
                let preis = dic["formattedPrice"]as! String
                let neueApp = App(name: name, version: version, preis: preis)
                self?.daten.append(neueApp)
                dispatch_async(dispatch_get_main_queue()) {
                    [weak self] in
                    self?.tableView.reloadData()
                }
                
            }
        }.resume()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daten.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let aktuelleApp = daten[indexPath.row]
        let titel = "\(aktuelleApp.name) \(aktuelleApp.version)"
        let untertitel = aktuelleApp.preis
        
        cell.textLabel?.text = titel
        cell.detailTextLabel?.text = untertitel
        
        return cell
    }
    
    

}

struct App {
    var name: String
    var version: String
    var preis: String
}

