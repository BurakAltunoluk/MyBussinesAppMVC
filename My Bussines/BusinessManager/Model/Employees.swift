//
//  Employees.swift
//  BusinessManager
//
//  Created by Burak Altunoluk on 21/07/2022.
//

import Foundation

struct Employees {
    
    var name : String
    var age : Int
    var wage : Int
    var title : EmployeTitle
    
    init(employeName: String, employeAge: Int,  employeTittle: EmployeTitle) {
        
        name = employeName
        age = employeAge
        title = employeTittle
        wage = 0
        
        switch title {
        case .assistant: wage = age * 100 + 10000
        case .authorized: wage = age * 200 + 10000
        }
    }

}
