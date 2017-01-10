//
//  rankingViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 12/17/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var recommendationRankingTableView: UITableView!
    @IBOutlet weak var readyToBookButton: UIButton!
    @IBOutlet weak var returnToSwipingButton: UIButton!
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        recommendationRankingTableView.layer.cornerRadius = 5
        recommendationRankingTableView.tableFooterView = UIView()
        readyToBookButton.isEnabled = false
        readyToBookButton.isHidden = true
        returnToSwipingButton.isEnabled = false
        returnToSwipingButton.isHidden = true
        
        //Load the values from our shared data container singleton
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        //Install the value into the label.
        if tripNameValue != nil {
            self.tripNameLabel.text =  "\(tripNameValue!)"
        }
    }
    
    // didReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let selectedActivity_0 = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "selected_activity_0") as? String
        let selectedActivity_1 = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "selected_activity_1") as? String
        let selectedActivity_2 = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "selected_activity_2") as? String
        let selectedActivity_3 = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "selected_activity_3") as? String

        
        let addedRow = indexPath.row
        let destinationsLabelsArray = ["Miami", "San Diego", "Marina del Rey (LA)", "Panama City Beach", "Ft. Lauderdale"]
        let pricesArray = ["$1,000","$950","$1,100","$1,000","$975"]
        let percentagesSwipedRightArray = ["100","75","50","25","25"]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "rankedRecommendationsPrototypeCell", for: indexPath) as! rankedRecommendationsTableViewCell
        
        cell.rankLabel.text = "#\(addedRow + 1)"
        cell.destinationLabel.text = destinationsLabelsArray[addedRow]
        cell.tripPrice.text = pricesArray[addedRow]
        cell.percentSwipedRight.text = "\(percentagesSwipedRightArray[addedRow])% swiped right"
        cell.preferredActivitiesPossibleAtDestination.text = "\(selectedActivity_0!), \(selectedActivity_1!), \(selectedActivity_2!), \(selectedActivity_3!)"

        cell.layer.cornerRadius = 10
        
        return (cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "destinationChosenSegue" {
            let destination = segue.destination as? ReviewAndBookViewController
            
            let path = recommendationRankingTableView.indexPathForSelectedRow! as IndexPath
            let cell = recommendationRankingTableView.cellForRow(at: path) as! rankedRecommendationsTableViewCell
            destination?.destinationLabelViaSegue = cell.destinationLabel.text!
            destination?.tripPriceViaSegue = cell.tripPrice.text!
        }

    }
    
    
    @IBAction func readyToBookButtonPressed(_ sender: Any) {

        self.performSegue(withIdentifier: "destinationChosenSegue", sender: self)

    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        readyToBookButton.isEnabled = true
        readyToBookButton.isHidden = false
        returnToSwipingButton.isEnabled = true
        returnToSwipingButton.isHidden = false
        
    }

}
