//
//  ViewController.swift
//  coredataBAse
//
//  Created by R83 on 07/04/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var idtext: UITextField!
    @IBOutlet weak var namefield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func saveDataButtonAction(_ sender: Any) {
        if let x = idtext.text, let y = Int(x) {
            addData(id: y, name: namefield.text ?? "")
        }
    }
    
    func addData(id:Int,name:String){
        guard let appDeleget = UIApplication.shared.delegate as? AppDelegate else { return }
        let manage = appDeleget.persistentContainer.viewContext
        
        let userentry = NSEntityDescription.entity(forEntityName: "Students", in: manage)!
        let user = NSManagedObject(entity: userentry, insertInto: manage)
        user.setValue(name, forKey: "name")
        user.setValue(id, forKey: "id")
        print(user)
    }
}

