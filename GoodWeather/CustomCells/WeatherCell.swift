//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Hwi kang on 2021/01/19.
//

import Foundation
import UIKit

class WeatherCell : UITableViewCell{
    
    @IBOutlet weak var name : UILabel!
    @IBOutlet weak var temp : UILabel!
    
    
    func config(vm:WeatherViewModel){
        self.name?.text = vm.name
        self.temp?.text = vm.currentTemp.temp.formatAsDegree
    }
    
}

