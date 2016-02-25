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
    
    var delegate: OpenWeatherMapDelegate!
    
    var zipCode = ""
    var weatherTemp = 0.0
    
    func getDegrees()
    {
        Alamofire.request(.GET, "http://api.openweathermap.org/data/2.5/weather?zip=\(zipCode),us&units=imperial&appid=625e9e3bac6a3dde3d015dee3e1b54e1").validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let dict = response.result.value as? Dictionary<String, AnyObject> {
                    let json = JSON(dict)
                    self.weatherTemp = json["main"]["temp"].doubleValue
                    print(json)
                    
            }
            case .Failure(let error):
                print(error)
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), {
            self.delegate.updateMood()
        })
    }
    
    
    
}

    

