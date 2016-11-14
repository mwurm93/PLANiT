//
//  groupRankingViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/17/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class groupRankingViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet var adjustLogisticsView: UIView!
    @IBOutlet weak var popupBlurView: UIVisualEffectView!
    @IBOutlet weak var editTextBox: UITextView!
    @IBOutlet weak var topItineraryTable: UITableView!
    @IBOutlet weak var userStatusIndicators: UITableView!
    
    // Outlets for buttons
    @IBOutlet weak var adjustTravelLogisticsButton: UIButton!
    
    // Create visual effect variable
    var effect:UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        effect = popupBlurView.effect
        popupBlurView.effect = nil
        
        adjustLogisticsView.layer.cornerRadius = 5
        editTextBox.layer.cornerRadius = 5
        topItineraryTable.layer.cornerRadius = 5
        userStatusIndicators.layer.cornerRadius = 5
    }

    //functions for adjusting logistics
    
    func animateAdjustLogisticsIn(){
        self.view.addSubview(adjustLogisticsView)
        adjustLogisticsView.center = self.view.center
        adjustLogisticsView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        adjustLogisticsView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.popupBlurView.effect = self.effect
            self.adjustLogisticsView.alpha = 1
            self.adjustLogisticsView.transform = CGAffineTransform.identity

        }
    }
    
    
    func dismissAdjustLogisticsOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.adjustLogisticsView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popupBlurView.effect = nil
            self.adjustLogisticsView.alpha = 0
        }) { (Success:Bool) in
            self.adjustLogisticsView.removeFromSuperview()
        }
    }
    
    func cancelAdjustLogisticsOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.adjustLogisticsView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popupBlurView.effect = nil
            self.adjustLogisticsView.alpha = 0
        }) { (Success:Bool) in
            self.adjustLogisticsView.removeFromSuperview()
        }
    }

    // MARK: Actions
    @IBAction func adjustMyTravelLogistics(_ sender: AnyObject) {
    animateAdjustLogisticsIn()
        
        // Disable main view buttons
        adjustTravelLogisticsButton.isEnabled = false
    }
    @IBAction func cancelAdjustLogistics(_ sender: AnyObject) {
    cancelAdjustLogisticsOut()
     
        // Enable main view buttons
        adjustTravelLogisticsButton.isEnabled = true
    }
    @IBAction func dismissAdjustLogistics(_ sender: AnyObject) {
    dismissAdjustLogisticsOut()
        
        // Enable main view buttons
        adjustTravelLogisticsButton.isEnabled = true
    }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
}
