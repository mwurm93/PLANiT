//
//  RecommendationsVoting.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/14/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class RecommendationSwipingViewController: UIViewController {

    // MARK: Outlets    
    @IBOutlet weak var recommendationsTable: UITableView!
    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var heartIcon: UIButton!
    @IBOutlet weak var rejectIcon: UIButton!
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        //round edges
        recommendationsTable.layer.cornerRadius = 5
        
        //Load the values from our shared data container singleton
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        //Install the value into the label.
        self.tripNameLabel.text =  "\(tripNameValue!)"
    }
    
    // didReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func rejectSelected(_ sender: Any) {
        if rejectIcon.currentImage == #imageLiteral(resourceName: "emptyX") && heartIcon.currentImage == #imageLiteral(resourceName: "emptyHeart"){
        rejectIcon.setImage(#imageLiteral(resourceName: "fullX"), for: UIControlState.normal)
        }
        else if rejectIcon.currentImage == #imageLiteral(resourceName: "emptyX") && heartIcon.currentImage == #imageLiteral(resourceName: "fullHeart"){
        rejectIcon.setImage(#imageLiteral(resourceName: "fullX"), for: UIControlState.normal)
        heartIcon.setImage(#imageLiteral(resourceName: "emptyHeart"), for: UIControlState.normal)
        }
        else if rejectIcon.currentImage == #imageLiteral(resourceName: "fullX") && heartIcon.currentImage == #imageLiteral(resourceName: "emptyHeart"){
        rejectIcon.setImage(#imageLiteral(resourceName: "emptyX"), for: UIControlState.normal)
        }
    }
    
    @IBAction func heartSelected(_ sender: Any) {
        if rejectIcon.currentImage == #imageLiteral(resourceName: "emptyX") && heartIcon.currentImage == #imageLiteral(resourceName: "emptyHeart"){
        heartIcon.setImage(#imageLiteral(resourceName: "fullHeart"), for: UIControlState.normal)
        }
        else if rejectIcon.currentImage == #imageLiteral(resourceName: "fullX") && heartIcon.currentImage == #imageLiteral(resourceName: "emptyHeart"){
            rejectIcon.setImage(#imageLiteral(resourceName: "emptyX"), for: UIControlState.normal)
            heartIcon.setImage(#imageLiteral(resourceName: "fullHeart"), for: UIControlState.normal)
        }
        else if rejectIcon.currentImage == #imageLiteral(resourceName: "emptyX") && heartIcon.currentImage == #imageLiteral(resourceName: "fullHeart"){
        heartIcon.setImage(#imageLiteral(resourceName: "emptyHeart"), for: UIControlState.normal)
        }
    }
}
