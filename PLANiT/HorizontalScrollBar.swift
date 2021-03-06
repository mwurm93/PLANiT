
//
//  HorizontalScrollBar.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 1/12/17.
//  Copyright © 2017 MICHAEL WURM. All rights reserved.
//

//import UIKit
//
//@objc protocol HorizontalScrollDelegate {
//    func numberOfScrollViewElements() -> Int
//    func elementAtScrollViewIndex(index: Int) -> UIView
//}
//
//class HorizontalScroll: UIView {
//    var delegate: HorizontalScrollDelegate?
//    var scroller: UIScrollView!
//    let PADDING: Int = 10
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setUpScroll()
//    }
//    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//        setUpScroll()
//    }
//    
//    func setUpScroll() {
//        scroller = UIScrollView()
//        self.addSubview(scroller)
//        
//        let dict = ["scroller": scroller]
//        
//        var constraint1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|[scroller]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict)
//        var constraint2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|[scroller]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict)
//        self.addConstraints(constraint1)
//        self.addConstraints(constraint2)
//    }
//    
//    override func didMoveToSuperview() {
//        reload()
//    }
//    
//    func reload () {
//        if let del = delegate{
//            
//            var xOffset: CGFloat = 0
//            for index in 0..<del.numberOfScrollViewElements() {
//                 let view = del.elementAtScrollViewIndex(index: index)
//                view.frame = CGRect(x: xOffset,y: CGFloat(PADDING),width: CGFloat(100.0),height: CGFloat(100.0))
//                
//                xOffset = xOffset + CGFloat(PADDING) + view.frame.size.width
//                scroller.addSubview(view)
//            }
//            scroller.contentSize = CGSize(width: xOffset, height: self.frame.height)
//        }
//    }
//}
