//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Hwi kang on 2021/01/19.
//

import Foundation


struct WeatherListViewModel {
    private var viewModels = [WeatherViewModel]()
    
    mutating func addModel(vm : WeatherViewModel){
        self.viewModels.append(vm)
    }
    
    func getModel(index:Int) -> WeatherViewModel{
        return viewModels[index]
    }
    
    func getLength() -> Int {
        return viewModels.count
    }
    
    mutating func toCelsius(){
        viewModels = viewModels.map { vm  in
            var viewModel = vm
            viewModel.currentTemp.temp = (viewModel.currentTemp.temp-32) * 5/9
            return viewModel
        }
        
    }
     mutating func toFarenheit(){
        viewModels = viewModels.map { vm  in
            var viewModel = vm
            viewModel.currentTemp.temp = (viewModel.currentTemp.temp *  5/9) + 32
            return viewModel
        }
        
    }
    
    mutating func updateUnit(to unit:Unit){
        switch unit{
        case .celsius:
            toCelsius()
        case .farenheit:
            toFarenheit()
        }
    }
}




struct WeatherViewModel : Decodable {
    
    var currentTemp : TemperatureViewModel
    let name : String
  
    //필드 이름 다를때 ?
    //코딩키 사용
    private enum CodingKeys:String,CodingKey{
        case name
        case currentTemp = "main"
    }
    
}


struct TemperatureViewModel :Decodable{
    var temp: Double
    let tempMin: Double
    let tempMax: Double
    
    private enum CodingKeys:String,CodingKey{
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
