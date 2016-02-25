//
//  WeatherApiCall.swift
//  WeatheringMood
//
//  Created by David Anglin on 2/24/16.
//  Copyright © 2016 David Anglin. All rights reserved.
//

import Foundation
import Alamofire

protocol OpenWeatherMapDelegate {
    func updateMood()
}

public class WeatherApi {
    
//    var openWeatherAPIKey = "625e9e3bac6a3dde3d015dee3e1b54e1"
//    let openWeatherMapURL = "http://api.openweathermap.org/data/2.5/weather"
    
    var delegate: OpenWeatherMapDelegate!
    
    var zipCode = ""
    
    func getDegrees()
    {
        Alamofire.request(.GET,"http://api.openweathermap.org/data/2.5/weather?zip=\(zipCode),us&appid=44db6a862fba0b067b1930da0d769e98").responseJSON
            { response in
                
                let json = response
                print(json)
                
                
        }
              
            
        
        
        
        delegate.updateMood()
        
        dispatch_async(dispatch_get_main_queue(), {
            self.delegate.updateMood()
        })
    }
    
    
//    openWeatherMapURL, parameters: ["q" : zipCode, "units" : "imperial", "APPID" : openWeatherAPIKey]    
}

    

