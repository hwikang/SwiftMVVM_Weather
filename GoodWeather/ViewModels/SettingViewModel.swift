//
//  SettingViewModel.swift
//  GoodWeather
//
//  Created by Hwi kang on 2021/01/19.
//

import Foundation
                    //allcase 사용가능
enum Unit : String , CaseIterable{
    case celsius = "metric"
    case farenheit = "imperial"
    
    var displayName : String {
        get {
            switch self {
            case .celsius:
                return "Celsius"
            case .farenheit:
                return "Farenheit"
            }
        }
    }
}





struct SettingViewModel {
    //온도 유닛
    private var _selectedUnit = Unit.farenheit
    let units = Unit.allCases
    
    
    var selectedUnit : Unit {
        
        get{
            let userDefaults = UserDefaults.standard
            //여기서 set 해주는듯
            if let value = userDefaults.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
            
            return _selectedUnit
            
        }
        set{
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}
