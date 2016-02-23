//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by David Anglin on 2/5/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate
{
    
    override func changeHappiness(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(faceView)
        var happinessChange = -Int(translation.y)
        if happinessChange != 0 {
            happinessChange = 0
        }
    }

  
    
   
}