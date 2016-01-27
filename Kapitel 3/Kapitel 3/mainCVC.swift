//
//  mainCVC.swift
//  Kapitel 3
//
//  Created by Udemy on 29.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class mainCVC: UICollectionViewController {

    let daten = ["AutoLayout", "IBDesignable", "ScrollView Teil 1", "ScrollView Teil 2"]
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daten.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! myCVCell
        cell.label.text = daten[indexPath.row]
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(daten[indexPath.row], sender: nil)
    }

}

class myCVCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
}















