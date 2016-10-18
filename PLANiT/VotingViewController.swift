//
//  RecommendationsVoting.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/14/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class VotingViewController: UIViewController {

    // MARK: Outlets    
    @IBOutlet weak var popupBlurView: UIVisualEffectView!
    @IBOutlet var NoGoodOptionsRationaleView: UIView!
    @IBOutlet var NoGoodOptionsCreateNewView: UIView!
    @IBOutlet var AdjustItineraryView: UIView!
    @IBOutlet weak var adjustItineraryTextRequest: UITextView!
    @IBOutlet weak var noGoodOptionsRationaleTable: UITableView!
    @IBOutlet weak var recommendationsTable: UITableView!
    @IBOutlet weak var userStatusIndicators: UITableView!
   
    //Outlets for disabling buttons
    @IBOutlet weak var proposeDifferentItineraryButton: UIButton!
    @IBOutlet weak var askConciergeToAdjustItineraryButton: UIButton!
    @IBOutlet weak var goToPreviousVCButton: UIButton!
    @IBOutlet weak var goToRecommendationsVCButton: UIButton!
    
    
    // Create visual effect variable
    var effect:UIVisualEffect!
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        effect = popupBlurView.effect
        popupBlurView.effect = nil
        
        //round edges
        NoGoodOptionsRationaleView.layer.cornerRadius = 5
        NoGoodOptionsCreateNewView.layer.cornerRadius = 5
        AdjustItineraryView.layer.cornerRadius = 5
        adjustItineraryTextRequest.layer.cornerRadius = 5
        noGoodOptionsRationaleTable.layer.cornerRadius = 5
        recommendationsTable.layer.cornerRadius = 5
        userStatusIndicators.layer.cornerRadius = 5
    }
    
    // Functions for Creating New Itinerary

    func animatePopupIn() {
        self.view.addSubview(NoGoodOptionsRationaleView)
        NoGoodOptionsRationaleView.center = self.view.center
        NoGoodOptionsRationaleView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        NoGoodOptionsRationaleView.alpha = 0
        
        
        
        UIView.animate(withDuration: 0.4) {
            self.popupBlurView.effect = self.effect
            self.NoGoodOptionsRationaleView.alpha = 1
            self.NoGoodOptionsRationaleView.transform = CGAffineTransform.identity
        }
    }
    
    func animatePopupRationaleViewToCreateView() {
        
        self.view.addSubview(NoGoodOptionsCreateNewView)
        self.NoGoodOptionsCreateNewView.alpha = 1
        self.NoGoodOptionsCreateNewView.transform = CGAffineTransform.identity
        NoGoodOptionsCreateNewView.center = self.view.center
        NoGoodOptionsRationaleView.alpha = 0
        self.NoGoodOptionsRationaleView.removeFromSuperview()
    }
    
    func dismissCreateNewView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.NoGoodOptionsCreateNewView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popupBlurView.effect = nil
            self.NoGoodOptionsCreateNewView.alpha = 0
        }) { (Success:Bool) in
            self.NoGoodOptionsCreateNewView.removeFromSuperview()
        }
    }
    
    func cancelRationaleView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.NoGoodOptionsRationaleView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popupBlurView.effect = nil
            self.NoGoodOptionsRationaleView.alpha = 0
        }) { (Success:Bool) in
            self.NoGoodOptionsRationaleView.removeFromSuperview()
        }
    }
    
    func cancelCreateNewView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.NoGoodOptionsCreateNewView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popupBlurView.effect = nil
            self.NoGoodOptionsCreateNewView.alpha = 0
        }) { (Success:Bool) in
            self.NoGoodOptionsCreateNewView.removeFromSuperview()
        }
    }
    
    
    // Functions for Adjusting an Itinerary
    func animateAdjustItineraryPopupIn() {
        self.view.addSubview(AdjustItineraryView)
        AdjustItineraryView.center = self.view.center
        AdjustItineraryView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        AdjustItineraryView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.popupBlurView.effect = self.effect
            self.AdjustItineraryView.alpha = 1
            self.AdjustItineraryView.transform = CGAffineTransform.identity
        }
    }

    
    func cancelAdjustItineraryView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.AdjustItineraryView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popupBlurView.effect = nil
            self.AdjustItineraryView.alpha = 0
        }) { (Success:Bool) in
            self.AdjustItineraryView.removeFromSuperview()
        }
    }
    
    func dismissAdjustItineraryView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.AdjustItineraryView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popupBlurView.effect = nil
            self.AdjustItineraryView.alpha = 0
        }) { (Success:Bool) in
            self.AdjustItineraryView.removeFromSuperview()
        }
    }
    
    //MARK: Actions
    //Actions for Creating a New Itinerary
    @IBAction func proposeDIfferentItinerary(_ sender: AnyObject) {
        animatePopupIn()
        
        //disable main view VC buttons
        proposeDifferentItineraryButton.isEnabled = false
        askConciergeToAdjustItineraryButton.isEnabled = false
        goToPreviousVCButton.isEnabled = false
        goToRecommendationsVCButton.isEnabled = false
    }
    @IBAction func createDIfferentItinerary(_ sender: AnyObject) {
        animatePopupRationaleViewToCreateView()
    }
    @IBAction func dismissPopupView(_ sender: AnyObject) {
        dismissCreateNewView()
       
        //enable main view VC buttons
        proposeDifferentItineraryButton.isEnabled = true
        askConciergeToAdjustItineraryButton.isEnabled = true
        goToPreviousVCButton.isEnabled = true
        goToRecommendationsVCButton.isEnabled = true

    }
    @IBAction func cancelPopupRatinonaleView(_ sender: AnyObject) {
        cancelRationaleView()
        //enable main view VC buttons
        proposeDifferentItineraryButton.isEnabled = true
        askConciergeToAdjustItineraryButton.isEnabled = true
        goToPreviousVCButton.isEnabled = true
        goToRecommendationsVCButton.isEnabled = true
    }
    @IBAction func cancelPopupCreateNewView(_ sender: AnyObject) {
        cancelCreateNewView()
        //enable main view VC buttons
        proposeDifferentItineraryButton.isEnabled = true
        askConciergeToAdjustItineraryButton.isEnabled = true
        goToPreviousVCButton.isEnabled = true
        goToRecommendationsVCButton.isEnabled = true
    }
    
    //Actions for Adjusting and Itinerary
    @IBAction func adjustItinerary(_ sender: AnyObject) {
        animateAdjustItineraryPopupIn()
        //disable main view VC buttons
        proposeDifferentItineraryButton.isEnabled = false
        askConciergeToAdjustItineraryButton.isEnabled = false
        goToPreviousVCButton.isEnabled = false
        goToRecommendationsVCButton.isEnabled = false
    }
    @IBAction func cancelAdjustItinerary(_ sender: AnyObject) {
        cancelAdjustItineraryView()
        //enable main view VC buttons
        proposeDifferentItineraryButton.isEnabled = true
        askConciergeToAdjustItineraryButton.isEnabled = true
        goToPreviousVCButton.isEnabled = true
        goToRecommendationsVCButton.isEnabled = true
    }
    @IBAction func dismissAdjustItinerary(_ sender: AnyObject) {
        dismissAdjustItineraryView()
        //enable main view VC buttons
        proposeDifferentItineraryButton.isEnabled = true
        askConciergeToAdjustItineraryButton.isEnabled = true
        goToPreviousVCButton.isEnabled = true
        goToRecommendationsVCButton.isEnabled = true
    }
    
    
    // didReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
