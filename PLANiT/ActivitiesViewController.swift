//
//  ActivitiesViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/17/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: Outlets
    @IBOutlet weak var userToggles: UITableView!
    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var activityItems: [ActivityItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initActivityItems()
        collectionView.reloadData()

        collectionView.layer.cornerRadius = 5
        userToggles.layer.cornerRadius = 5
        
        //Load the values from our shared data container singleton
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        //Install the value into the label.
        if tripNameValue != nil {
            self.tripNameLabel.text =  "\(tripNameValue!)"
        }
    }

    fileprivate func initActivityItems() {
        
        var items = [ActivityItem]()
        let inputFile = Bundle.main.path(forResource: "items", ofType: "plist")
        
        let inputDataArray = NSArray(contentsOfFile: inputFile!)
        
        for inputItem in inputDataArray as! [Dictionary<String, String>] {
            let activityItem = ActivityItem(dataDictionary: inputItem)
            items.append(activityItem)
        }
        activityItems = items
    }
    
    // MARK: - UICollectionViewDataSource
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activityItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "activitiesViewPrototypeCell", for: indexPath) as! ActivitiesCollectionViewCell
        
        cell.setActivityItem(activityItems[indexPath.row])

        // Set border color
            cell.layer.borderWidth = 4.0
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = collectionView.cellForItem(at: indexPath)
        if selectedCell?.layer.borderColor == UIColor.lightGray.cgColor
            {
            selectedCell?.layer.borderColor = UIColor.blue.cgColor
            }
        else if selectedCell?.layer.borderColor == UIColor.blue.cgColor
        {
            selectedCell?.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        // Create alert with index
//        let alert = UIAlertController(title: "didSelectItemAtIndexPath:", message: "Indexpath = \(indexPath)", preferredStyle: .alert)
//        
//        let alertAction = UIAlertAction(title: "Dismiss", style: .destructive, handler: nil)
//        alert.addAction(alertAction)
//        
//        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UICollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width / 4.0
        return CGSize(width: picDimension, height: picDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftRightInset = self.view.frame.size.width / 14.0
        return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
    }

}
