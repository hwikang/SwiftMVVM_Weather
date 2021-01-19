//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Hwi kang on 2021/01/19.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeather(vm:WeatherViewModel)
}


class AddWeatherCityViewController: UIViewController {
    
    var delegate : AddWeatherDelegate?
    @IBOutlet weak var cityNameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSave(_ sender: UIButton) {
        if let cityName = cityNameTextField.text{
            print(cityName)
            let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(Constant().appid)&units=imperial")!
            let resource = Resource<WeatherViewModel>(url: url) { data in
                guard let decoded = try? JSONDecoder().decode(WeatherViewModel.self, from: data) else {
                   fatalError("decoding error")
                }
                return decoded
               
            }
            
            Webservice().load(resource: resource) { (result) in
                if let result = result {
//                    if let delegate = self.delegate
                    self.delegate?.addWeather(vm: result)
                    self.dismiss(animated: true, completion: nil)

                }
            }
        }
    }
    
    @IBAction func onClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
