//
//  FirstViewController.swift
//  Personal_BMI_Index
//
//  Created by Bhavya Shah on 2019-12-11.
//  Copyright © 2019 Bhavya Shah. All rights reserved.
//

import UIKit
import Firebase

class FirstViewController: UIViewController {

    var ref: DatabaseReference!
    var lastCalculationType: Int?

    @IBOutlet weak var toggleunit: UISwitch!
    
    @IBOutlet weak var namefield: UITextField!
    
    @IBOutlet weak var agefield: UITextField!
    
    @IBOutlet weak var genderfield: UITextField!
    
    @IBOutlet weak var weightfield: UITextField!
    
    @IBOutlet weak var heightfield: UITextField!
  
    @IBOutlet weak var resultBmi: UITextField!
    
    @IBAction func submit(_ sender: UIButton) {
        if (namefield.text != "")
            && (agefield.text != "")
            && (genderfield.text != "")
            && (weightfield.text != "")
            && (heightfield.text != "")
        {
            saveData().self
            namefield.text = ""
            agefield.text = ""
            genderfield.text = ""
            weightfield.text = ""
            heightfield.text = ""
            
            //self.tabBarController?.selectedIndex = 
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

    @IBAction func calculate(_ sender: UIButton) {
        if weightfield.text != nil && heightfield.text != nil, var weight = Double(weightfield.text!), var height = Double(heightfield.text!) {
                self.view.endEditing(true)
                //Calculating BMI using metric, so convert to metric first
                if !toggleunit.isOn {
                    (weight) *= 0.453592;
                    (height) *= 0.0254;
                }
                    let BMI: Double = weight / (height * height)
                    let shortBMI = String(format: "%.2f", BMI)
                    var resultText = "\(shortBMI)"
                    var descriptor : String?
                    if(BMI < 16.0) { descriptor = "Severely Thin" }
                    else if(BMI < 16.99) { descriptor = "Moderately Thin" }
                    else if(BMI < 18.49) { descriptor = "Slightly Thin" }
                    else if(BMI < 24.99) { descriptor = "Normal" }
                    else if(BMI < 29.99) { descriptor = "Overweight" }
                    else if(BMI < 34.99) { descriptor = "Moderately Obese" }
                    else if(BMI < 39.99) { descriptor = "Severely Obese" }
                    else { descriptor = "Very Severely Obese" }
                    //resultText += descriptor!
                    print(resultText)
                    resultBmi.text = resultText
                    resultBmi.isHidden = false
                    lastCalculationType = 0
            
        }
                else {
                    resultBmi.text = "Please fill out your height and weight."
                    resultBmi.isHidden = false
                    lastCalculationType = 0
                }
    }
    
}
