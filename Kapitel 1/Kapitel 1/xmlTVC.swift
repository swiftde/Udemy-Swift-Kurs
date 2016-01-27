//
//  xmlTVC.swift
//  Kapitel 1
//
//  Created by Udemy on 27.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class xmlTVC: UITableViewController {

    let URL = "http://www.ard.de/home/ard/ARD_Startseite/21920/index.xml"
    var daten = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parser = XMLParser(url: URL)
        parser.parse {
            daten in
            self.daten = daten
            self.tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daten.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = daten[indexPath.row]["title"]
        cell.detailTextLabel?.text = daten[indexPath.row]["description"]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("xmlDetail", sender: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let zielViewController = segue.destinationViewController as? xmlDetailVC where segue.identifier == "xmlDetail" {
            
            zielViewController.link = daten[(sender as! NSIndexPath).row]["link"]
        }
    }
}


class xmlDetailVC: UIViewController {
    
    var link: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let link = link {
            let frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            let webView = UIWebView(frame: frame)
            let tempLink = link.componentsSeparatedByString("\n").first ?? ""
            let request = NSURLRequest(URL: NSURL(string: tempLink)!)
            webView.loadRequest(request)
            view.addSubview(webView)
        }
    }
    
}

