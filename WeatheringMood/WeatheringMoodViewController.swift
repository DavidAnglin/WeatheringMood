//
//  ViewController.swift
//  WeatheringMood
//
//  Created by David Anglin on 2/23/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

import UIKit


class WeatheringMoodViewController: HappySadViewController, UITextFieldDelegate, OpenWeatherMapDelegate
{
    
    var weatherData = WeatherApi()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherData.delegate = self
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        
    }
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    
    
    var zipCodeText: String? = ""   {
        didSet {
            zipCodeSearchField.text = zipCodeText
        }
    }


    @IBOutlet weak var zipCodeSearchField: UITextField!
    {
        didSet {
            zipCodeSearchField.delegate = self
            zipCodeSearchField.text = zipCodeText
        }
    }    

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == zipCodeSearchField {
            textField.resignFirstResponder()
            zipCodeText = textField.text
        }
        return true
    }
    
    
    let limit = 5
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return (textField.text?.utf16.count ?? 0) + string.utf16.count - range.length <= limit
    }
    

    var temp: Double = 0
    
    func updateMood()
    {
        temp = self.weatherData.weatherTemp
        performSegueWithIdentifier("weatherFace", sender: self)
    }
        
        
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController!
        }
        if let wmvc = destination as? HappySadViewController {
            if let identifer = segue.identifier {
                switch identifer {
                case "weatherFace":
                    let temp = self.weatherData.weatherTemp
                    if temp <= 70 {
                        wmvc.happySad = 0
                        wmvc.temperture = temp
                } else {
                    wmvc.happySad = 100
                    wmvc.temperture = temp
                }
                default: break
            }
        }
    }
}

    @IBAction func decisions(sender: UIButton)
    {
        if ((zipCodeSearchField as? UITextField) != nil) {
            self.weatherData.zipCode = zipCodeSearchField.text!
            self.weatherData.getDegrees()
        }
    }
}

