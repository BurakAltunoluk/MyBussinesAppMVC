//
//  ViewController.swift
//  BusinessManager
//
//  Created by Burak Altunoluk on 21/07/2022.
//

import UIKit

final class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var assistand = [String]()
    var authorized = [String]()
    var numberOfRow = 0
    
    @IBOutlet private var editButtonOutlet: UIButton!
    @IBOutlet private var numberOfAuthorized: UILabel!
    @IBOutlet private var numberOfAssistant: UILabel!
    @IBOutlet private var numberOfEmploye: UITextField!
    @IBOutlet private var companyBudget: UITextField!
    @IBOutlet private var companyNameLabel: UITextField!
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       preaperLoading()
    }
    
    @IBAction func editButton(_ sender: UIButton) {
        
        if companyNameLabel.isEnabled == false {
            self.companyNameLabel.isEnabled = true
            self.companyBudget.isEnabled = true
            editButtonOutlet.setTitle("Ok", for: UIControl.State.normal)
        } else {
           
            self.companyNameLabel.isEnabled = false
            self.companyBudget.isEnabled = false
            editButtonOutlet.setTitle("Edit", for: UIControl.State.normal)
        }
        
        myCompany.budget = Int(companyBudget.text!)!
        myCompany.name = companyNameLabel.text!
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEmployeInfo" {
            let destinationVc = segue.destination as! EmployeInfoVC
            destinationVc.NumberOfRow = numberOfRow
        }
    }
    
    func preaperLoading() {
        
        assistand = [String]()
        authorized = [String]()
    
        for i in myCompany.employe {
            if i.title == .assistant {
                assistand.append(i.name)
            }
            if i.title == .authorized {
                authorized.append(i.name)
            }
        }

        companyNameLabel.text = myCompany.name
        companyBudget.text = String(myCompany.budget)
        numberOfEmploye.text = String(myCompany.employe.count)
        numberOfAssistant.text = "Assistand: \(assistand.count)"
        numberOfAuthorized.text = "Authorized \(authorized.count)"
      
    }
}


//MARK: TableView
extension MainVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCompany.employe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = " \(myCompany.employe[indexPath.row].title) - \(myCompany.employe[indexPath.row].name)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            myCompany.deleteStaff(rowNumber: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            preaperLoading()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        numberOfRow = indexPath.row
        performSegue(withIdentifier: "toEmployeInfo", sender: (Any).self)
    }
    
 
    
}
