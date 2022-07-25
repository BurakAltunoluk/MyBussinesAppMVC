//
//  EmployeInfoVC.swift
//  BusinessManager
//
//  Created by Burak Altunoluk on 24/07/2022.
//

import UIKit

final class EmployeInfoVC: UIViewController {
    var NumberOfRow = -1
    
    @IBOutlet var segmentController: UISegmentedControl!
    @IBOutlet private var employeName: UITextField!
    @IBOutlet private var employeAge: UITextField!
    @IBOutlet private var employeWage: UITextField!
    @IBOutlet private var employeTitle: UITextField!
    
    @IBAction func segmentController(_ sender: Any) {
        
        switch segmentController.selectedSegmentIndex {
        case 0: employeTitle.text = "assistant"
        case 1: employeTitle.text = "authorized"
        default: break
        }
        
    }
    @IBAction func updateButton(_ sender: UIButton) {
        
        if employeAge.text != ""  && employeName.text != "" {
            if NumberOfRow != -1 {
                myCompany.employe[NumberOfRow].name = employeName.text!
                myCompany.employe[NumberOfRow].age = Int(employeAge.text!)!
                myCompany.employe[NumberOfRow].wage = Int(employeWage.text!)!
                myCompany.employe[NumberOfRow].title = EmployeTitle(rawValue: employeTitle.text!) ?? .assistant
               
                
            } else {
                let newStaff = Employees(employeName: employeName.text!, employeAge: Int(employeAge.text!)!, employeTittle: EmployeTitle(rawValue: employeTitle.text!) ?? .assistant)
                myCompany.employe.append(newStaff)
            }
            performSegue(withIdentifier: "toMain", sender: nil)
            
        } else { alert() }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NumberOfRow != -1 {
            
            employeName.text = myCompany.employe[NumberOfRow].name
            employeAge.text = String(myCompany.employe[NumberOfRow].age )
            employeWage.text = String(myCompany.employe[NumberOfRow].wage )
            employeTitle.text = myCompany.employe[NumberOfRow].title.rawValue
            if myCompany.employe[NumberOfRow].title == .authorized {
                segmentController.selectedSegmentIndex = 1
            }
        }
    }
    
    
    func alert() {
        let alert = UIAlertController(title: "Alert", message: "Fill in all blank fields ", preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
}
