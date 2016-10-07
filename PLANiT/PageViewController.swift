//
//  PageViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/7/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class PreferencesPageViewController: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
    }
    
    private(set) var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController("Green"),
                self.newColoredViewController("Red"),
                self.newColoredViewController("Blue")]
    }()
    
    private func newColoredViewController(color: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(color)ViewController")
    }
}

// MARK: UIPageViewControllerDataSource

extension PreferencesPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil

    }
    
}

