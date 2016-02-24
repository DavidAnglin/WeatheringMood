//
//  ViewController.swift
//  WeatheringMood
//
//  Created by David Anglin on 2/23/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

import UIKit
import Alamofire


class WeatheringMoodViewController: UIViewController, UITextFieldDelegate
{
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    let openWeatherSite = "http://api.openweathermap.org/data/2.5/weather"
    func getData(zip: String) {
        Alamofire.request(.GET, openWeatherSite, parameters: ["q":zip, "units":"imperial"])
            .responseJSON { response in
          
        }
//        zipCodeText = zip
    }

    
//    "?zip=\(zip),us&units=imperial&appid=44db6a862fba0b067b1930da0d769e98"
    
    @IBAction func decisions(sender: UIButton)
    {
        getData(zipCodeText!)
    }
    

    

}

