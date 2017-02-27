//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Md. Kamrul Hasan on 2/27/17.
//  Copyright © 2017 MKHG Lab. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let employee = Employee(context: context)
        employee.id = 1
        employee.name = "Kamrul"
        
        do{
           try context.save()
        
        }catch{
            print("Saving error.")
        }
        
        
        
        do{
            print("printing...started")
            let employees = try context.fetch(Employee.fetchRequest())
            let employeesObjects = employees as! [Employee]
            for tmpEmployee in employeesObjects{
                print("id: \(tmpEmployee.id)")
                print("name: \(tmpEmployee.name)")
            }
            print("printing...ended")
        }catch{
            print("Error")
        }
        
        /**
         output:
         printing...started
         id: 1
         name: Optional("Kamrul")
         printing...ended
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

