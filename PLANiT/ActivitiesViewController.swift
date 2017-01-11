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
    @IBOutlet weak var activitiesSearchBar: UISearchBar!
    @IBOutlet weak var tripRecommendationsLabel: UILabel!
    @IBOutlet weak var rightArrowButton: UIButton!
    @IBOutlet weak var buttonBeneathLabel: UIButton!
    
    var activityItems: [ActivityItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.allowsMultipleSelection = true
        
        // Hide next button
        tripRecommendationsLabel.isHidden = true
        rightArrowButton.isHidden = true
        rightArrowButton.isUserInteractionEnabled = false
        buttonBeneathLabel.isHidden = true
        buttonBeneathLabel.isUserInteractionEnabled = false
        
        // Call collection initializer
        initActivityItems()
        collectionView.reloadData()

        //update aesthetics
        collectionView.layer.cornerRadius = 5
        collectionView.layer.backgroundColor = UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 0).cgColor
        userToggles.layer.cornerRadius = 5
        
        // Set appearance of search bar
        activitiesSearchBar.layer.cornerRadius = 5
        let textFieldInsideSearchBar = activitiesSearchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.white
        let textFieldInsideSearchBarLabel = textFieldInsideSearchBar!.value(forKey: "placeholderLabel") as? UILabel
        textFieldInsideSearchBarLabel?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        let clearButton = textFieldInsideSearchBar?.value(forKey: "clearButton") as! UIButton
        clearButton.setImage(clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
        clearButton.tintColor = UIColor.white
        let glassIconView = textFieldInsideSearchBar?.leftView as? UIImageView
        glassIconView?.image = glassIconView?.image?.withRenderingMode(.alwaysTemplate)
        glassIconView?.tintColor = UIColor.white
        
        //Load the values from our shared data container singleton
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        //Install the value into the label.
        if tripNameValue != nil {
            self.tripNameLabel.text =  "\(tripNameValue!)"
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        // Update cell border color to blue if saved as a selected activity
        let selectedActivities = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "selected_activities") as? [String]
        
        let visibleCellIndices = self.collectionView.indexPathsForVisibleItems
        for visibleCellIndex in visibleCellIndices {
            let visibleCell = collectionView.cellForItem(at: visibleCellIndex) as! ActivitiesCollectionViewCell
            if selectedActivities != nil {
            if (selectedActivities?.contains(visibleCell.activityLabel.text!))! {
                visibleCell.layer.borderColor = UIColor.blue.cgColor
                collectionView.selectItem(at: visibleCellIndex, animated: true, scrollPosition: .top)
            }
            else {
                visibleCell.layer.borderColor = UIColor(red: 25/255, green: 135/255, blue: 255/255, alpha: 0).cgColor
                collectionView.deselectItem(at: visibleCellIndex, animated: true)
            }
            }
            else {
                visibleCell.layer.borderColor = UIColor(red: 25/255, green: 135/255, blue: 255/255, alpha: 0).cgColor
                collectionView.deselectItem(at: visibleCellIndex, animated: true)
            }
        }
        
        if selectedActivities != nil {
            // Show next button
            tripRecommendationsLabel.isHidden = false
            rightArrowButton.isHidden = false
            rightArrowButton.isUserInteractionEnabled = true
            buttonBeneathLabel.isHidden = false
            buttonBeneathLabel.isUserInteractionEnabled = true
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
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        collectionView.allowsMultipleSelection = true

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "activitiesViewPrototypeCell", for: indexPath) as! ActivitiesCollectionViewCell
        
        cell.setActivityItem(activityItems[indexPath.row])
        cell.layer.borderWidth = 3.5
        cell.layer.borderColor = UIColor(red: 25/255, green: 135/255, blue: 255/255, alpha: 0).cgColor
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    // Item DEselected: update border color and save data when
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        // Change border color to grey
        let deSelectedCell = collectionView.cellForItem(at: indexPath)
        deSelectedCell!.layer.borderColor = UIColor(red: 25/255, green: 135/255, blue: 255/255, alpha: 0).cgColor
        
        // Create array of selected activities
        var selectedActivities = [String?]()
        let indexPaths = self.collectionView!.indexPathsForSelectedItems
        for indexItem in indexPaths! {
            let currentCell = collectionView.cellForItem(at: indexItem)! as! ActivitiesCollectionViewCell
            let selectedActivity = currentCell.activityLabel.text
            selectedActivities.append(selectedActivity)
        }
        
        // Save array of selected activities to trip data model
        var existing_trips = DataContainerSingleton.sharedDataContainer.usertrippreferences
        let currentTripIndex = DataContainerSingleton.sharedDataContainer.currenttrip!
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        let multipleDestionationsValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "multiple_destinations") as? String
        let travelingInternationalValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "traveling_international") as? String
        let suggestDestinationControlValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "suggest_destination_control") as? String
        let suggestedDestinationValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "suggested_destination") as? String
        let budgetValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "budget") as? String
        let selectedDates = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "selected_dates") as? [Date]

        let updatedTripToBeSaved = ["trip_name": tripNameValue, "multiple_destinations": multipleDestionationsValue, "traveling_international": travelingInternationalValue, "suggest_destination_control": suggestDestinationControlValue, "suggested_destination": suggestedDestinationValue, "budget": budgetValue, "selected_activities": selectedActivities, "selected_dates": selectedDates] as [String : Any]
        existing_trips?[currentTripIndex] = updatedTripToBeSaved as NSDictionary
        DataContainerSingleton.sharedDataContainer.usertrippreferences = existing_trips
        
        if selectedActivities.count == 0 {
            // Show next button
            tripRecommendationsLabel.isHidden = true
            rightArrowButton.isHidden = true
            rightArrowButton.isUserInteractionEnabled = false
            buttonBeneathLabel.isHidden = true
            buttonBeneathLabel.isUserInteractionEnabled = false
        }
    }
    
    // Item SELECTED: update border color and save data when
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Change border color to grey
        let SelectedCell = collectionView.cellForItem(at: indexPath)
        SelectedCell!.layer.borderColor = UIColor.blue.cgColor
        
        // Create array of selected activities
        var selectedActivities = [String?]()
        let indexPaths = self.collectionView!.indexPathsForSelectedItems
        for indexItem in indexPaths! {
            let currentCell = collectionView.cellForItem(at: indexItem)! as! ActivitiesCollectionViewCell
            let selectedActivity = currentCell.activityLabel.text
            selectedActivities.append(selectedActivity)
            
        }
        
        // Save array of selected activities to trip data model
        var existing_trips = DataContainerSingleton.sharedDataContainer.usertrippreferences
        let currentTripIndex = DataContainerSingleton.sharedDataContainer.currenttrip!
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        let multipleDestionationsValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "multiple_destinations") as? String
        let travelingInternationalValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "traveling_international") as? String
        let suggestDestinationControlValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "suggest_destination_control") as? String
        let suggestedDestinationValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "suggested_destination") as? String
        let budgetValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "budget") as? String
        let selectedDates = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "selected_dates") as? [Date]

        let updatedTripToBeSaved = ["trip_name": tripNameValue, "multiple_destinations": multipleDestionationsValue, "traveling_international": travelingInternationalValue, "suggest_destination_control": suggestDestinationControlValue, "suggested_destination": suggestedDestinationValue, "budget": budgetValue, "selected_activities": selectedActivities, "selected_dates": selectedDates] as [String : Any]
        existing_trips?[currentTripIndex] = updatedTripToBeSaved as NSDictionary
        DataContainerSingleton.sharedDataContainer.usertrippreferences = existing_trips
        
        if selectedActivities.count > 0 {
            // Show next button
            tripRecommendationsLabel.isHidden = false
            rightArrowButton.isHidden = false
            rightArrowButton.isUserInteractionEnabled = true
            buttonBeneathLabel.isHidden = false
            buttonBeneathLabel.isUserInteractionEnabled = true
        }
    }
    
    
    
    // MARK: - UICollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width / 4.2
        return CGSize(width: picDimension, height: picDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftRightInset = self.view.frame.size.width / 14.0
        return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
    }
}
