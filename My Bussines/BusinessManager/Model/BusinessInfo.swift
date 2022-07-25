//
//  BusinessInfo.swift
//  BusinessManager
//
//  Created by Burak Altunoluk on 21/07/2022.
//

import Foundation

struct BusinessInfo {
    var name: String
    var budget: Int
    var employe = [Employees]()
    
    init(businessName: String, businessBudget: Int) {
        name = businessName
        budget = businessBudget
    }
    
    mutating func newStaff(name: String, age: Int, title: EmployeTitle)  {
        let newStaff = Employees(employeName: name, employeAge: age, employeTittle: title)
        employe.append(newStaff)
    }
    
    mutating func deleteByName(name: String) {
            var row = -1
        
            for i in employe {
                row += 1
                if i.name == name {
                    employe.remove(at: row)
                }
            }
        }
 
    mutating func deleteStaff(rowNumber: Int) {
        employe.remove(at: rowNumber)
    }
  
    
}
