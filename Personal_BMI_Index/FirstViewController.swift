//
//  FirstViewController.swift
//  Personal_BMI_Index
//
//  Created by Bhavya Shah on 2019-12-11.
//  Copyright © 2019 Bhavya Shah. All rights reserved.
//

import UIKit
import Firebase

class FirstViewController: UIViewController{

    var ref: DatabaseReference!

    @IBOutlet weak var namefield: UITextField!
    
    @IBOutlet weak var agefield: UITextField!
    @IBOutlet weak var genderfield: UITextField!
    
    @IBOutlet weak var weightfield: UITextField!
    
    @IBOutlet weak var heightfield: UITextField!
    
    @IBAction func submit(_ sender: UIButton) {
        if (namefield.text != "")
            || (agefield.text != "")
            || (genderfield.text != "")
            || (weightfield.text != "")
            || (heightfield.text != "")
        {
            saveData()
            namefield.text = ""
            agefield.text = ""
            genderfield.text = ""
            weightfield.text = ""
            heightfield.text = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ref = Database.database().reference().child("Avatar")
    }
    
    func saveData() {
        let key = ref.childByAutoId().key
        let avatar = ["name": namefield.text! as String,
                    "age": agefield.text! as String,
                    "gender": genderfield.text! as String,
                    "weight": weightfield.text! as String,
                    "height": heightfield.text! as String,]
        ref.child(key!).setValue(avatar)
    }

}

