//
//  HappySadViewController.swift
//  HappySad
//
//  Created by David Anglin on 2/23/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

import UIKit

class HappySadViewController: UIViewController, ExpressionViewDataSource
{
    

    
    @IBOutlet weak var expressionView: ExpressionView!
    {
        didSet {
            expressionView.dataSource = self
        }
    }
    
    var temperture: Double = 0
  
 

 
    
    
    var happySad: Int = 100 { // 0 = very sad, 100 = ecstatic
        didSet {
            happySad = min(max(happySad, 0), 100)
            updateUI()
        }
    }
    
   
   
    @IBOutlet weak var tempLabel: UILabel! {
        didSet {
            tempLabel.text = "Temperture = \(temperture)"
        }
    }
    
    
  
    
//    var minimumPressDuration: CFTimeInterval = 0.0
    
//    @IBAction func changeMood(gesture: UILongPressGestureRecognizer)
//    {
//        gesture.minimumPressDuration = 0.0
//        switch gesture.state {
//            case .Began: fallthrough
//            case.Changed:
//                self.happySad = 0
//            case .Ended:
//                self.happySad = 100
//            default: break
//            }
//    }
    
    func updateUI() {
        expressionView?.setNeedsDisplay()
    }
    
    func smilinessForExpressionView(sender: ExpressionView) -> Double? {
        return Double(happySad - 50) / 50
    }

}

