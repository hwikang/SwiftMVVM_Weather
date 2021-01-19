//
//  WeatherListTableTableViewController.swift
//  GoodWeather
//
//  Created by Hwi kang on 2021/01/19.
//

import UIKit

class WeatherListTableTableViewController: UITableViewController,AddWeatherDelegate,SetSettingDelegate {
    func setUnit(vm: SettingViewModel) {
        print("setting done \(vm)")
        self.weatherList.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
    
    
    var weatherList = WeatherListViewModel()
    func addWeather(vm: WeatherViewModel) {
        print(vm)
        self.weatherList.addModel(vm: vm)
        self.tableView.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        

       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue 구별 하기

        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingTableViewController" {
            prepareSegueForSettingTableViewController(segue: segue)
        }
        
      
        
        
        
        
    }
    func prepareSegueForAddWeatherCityViewController(segue : UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else { fatalError("nav not found")}
        guard let addWeatherVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("vc not found")
        }
        
        //delegate 지정
        addWeatherVC.delegate = self
    }
    func prepareSegueForSettingTableViewController(segue : UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else { fatalError("nav not found")}
        guard let settingVC = nav.viewControllers.first as? SettingTableViewController else {
            fatalError("vc not found")
        }
        
        //delegate 지정
        settingVC.delegate = self
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherList.getLength()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell",for: indexPath) as! WeatherCell
        let model = weatherList.getModel(index: indexPath.row)
        cell.config(vm: model)
        
        
        
        return cell
    }

   

}
