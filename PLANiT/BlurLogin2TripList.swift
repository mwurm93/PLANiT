//
//  Blur_Login_to_TripsList.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/11/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class BlurLogin2TripList: UIStoryboardSegue {
    
    override func perform() {
        
        //set the ViewControllers for the animation
        
        let sourceView = self.source.view as UIView!
        let destinationView = self.destination.view as UIView!
        var completionvariable = false
        
        let window = UIApplication.shared.delegate?.window!
        //set the destination View center
        //destinationView?.center = CGPoint(x: (sourceView?.center.x)!, y: (sourceView?.center.y)! - (destinationView?.center.y)!)
        
        // the Views must be in the Window hierarchy, so insert as a subview the destionation above the source
        window?.insertSubview(destinationView!, aboveSubview: sourceView!)
        
        //create UIAnimation- change the views's position when present it
        UIView.transition(from: sourceView!, to: destinationView!, duration: 1.3 , options: UIViewAnimationOptions.transitionCrossDissolve, completion: {(finished: Bool) -> Void in completeTransition(_, didComplete: Bool)
            }
        )
    }
}
