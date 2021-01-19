//
//  SettingTableTableViewController.swift
//  GoodWeather
//
//  Created by Hwi kang on 2021/01/19.
//

import UIKit

protocol SetSettingDelegate {
    func setUnit(vm:SettingViewModel)
}

class SettingTableViewController: UITableViewController {

    
    private var settingViewModel = SettingViewModel()
    var delegate : SetSettingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    @IBAction func onDone(_ sender: UIBarButtonItem) {
        delegate?.setUnit(vm: self.settingViewModel)
        self.dismiss(animated: true, completion: nil)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.settingViewModel.units.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(self.settingViewModel.units.count)
        let item = self.settingViewModel.units[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        cell.textLabel?.text = item.displayName
        
        
        if(item == settingViewModel.selectedUnit){
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //uncheck all
        tableView.visibleCells.forEach { (cell) in
            cell.accessoryType = .none
        }
        if let cell =  tableView.cellForRow(at: indexPath){
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            self.settingViewModel.selectedUnit = unit

        }
        
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell =  tableView.cellForRow(at: indexPath){
            cell.accessoryType = .none
        }
    }
 

}
