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
    
    // Create visual effect variable
    var effect:UIVisualEffect!
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        effect = popupBlurView.effect
        popupBlurView.effect = nil
        
        NoGoodOptionsRationaleView.layer.cornerRadius = 5
        NoGoodOptionsCreateNewView.layer.cornerRadius = 5
    }
    
    
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
    
    func dismissPopup() {
        UIView.animate(withDuration: 0.4, animations: { 
            self.NoGoodOptionsCreateNewView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.NoGoodOptionsCreateNewView.alpha = 0
            
            self.popupBlurView.effect = nil
        }) { (Success:Bool) in
                self.NoGoodOptionsCreateNewView.removeFromSuperview()
        }
        self.NoGoodOptionsCreateNewView.removeFromSuperview()
    }
    
    //MARK: Actions
    @IBAction func proposeDIfferentItinerary(_ sender: AnyObject) {
        animatePopupIn()
    }
    @IBAction func createDIfferentItinerary(_ sender: AnyObject) {
        animatePopupRationaleViewToCreateView()
    }
    
    @IBAction func dismissPopupView(_ sender: AnyObject) {
        dismissPopup()
    }
    
    // didReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
