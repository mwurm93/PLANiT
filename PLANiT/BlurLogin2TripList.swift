//
//  BlurLogin2TripsList.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/11/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//
//
//import UIKit
//
//class BlurLogin2TripList: UIStoryboardSegue, UIViewControllerAnimatedTransitioning {
//    
//    //override init(identifier: String?, source: UIViewController, destination: UIViewController) {
//        //super.init(identifier: source:destination:performHandler)
//    
//        override func perform() {
//            
//            //set the ViewControllers for the animation
//            
//            let sourceView = self.source.view as UIView!
//            let destinationView = self.destination.view as UIView!
//            
//            let window = UIApplication.shared.delegate?.window!
//            
//            // the Views must be in the Window hierarchy, so insert as a subview the destionation above the source
//            window?.insertSubview(destinationView!, aboveSubview: sourceView!)
//            
//            //create UIAnimation- change the views's position when present it
//            UIView.transition(from: sourceView!, to: destinationView!, duration: 1.3 , options: UIViewAnimationOptions.transitionCrossDissolve, completion: {_ in
//                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)                })
//        }
//}
//
//class CustomPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
//
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return 2.5
//    }
//    
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        
//        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
//        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
//        let finalFrameForVC = transitionContext.finalFrame(for: toViewController)
//        let containerView = transitionContext.containerView
//        //let bounds = UIScreen.main.bounds
//        //toViewController.view.frame = finalFrameForVC.offsetBy(dx: 0, dy: bounds.size.height)
//        containerView.addSubview(toViewController.view)
//        
//        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, options: .transitionCrossDissolve, animations: {
//            fromViewController.view.alpha = 0.5
//            toViewController.view.frame = finalFrameForVC
//            }, completion: {
//                finished in
//                transitionContext.completeTransition(true)
//                fromViewController.view.alpha = 1.0
//        })
//}
//}
