//
//  FirstViewController.swift
//  File name: Personal_BMI_Index
//  Author name: Bhavya shah
//  Student Id : 301076681
//  Created by Bhavya Shah on date : 2019-12-11.
//  Copyright © 2019 Bhavya Shah. All rights reserved.


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
  
    @IBOutlet weak var resultBmi: UILabel!
    
    @IBOutlet weak var descriptlabel: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //If return is pressed on the height field, proceed to the weight field
        if(textField === heightfield) {
            textField.resignFirstResponder()
            weightfield.becomeFirstResponder()
        }
            //If return is pressed on the weight field, calculate.
        else if(textField === weightfield) {
            if let height = heightfield.text, let weight = weightfield.text {
                if !(height.isEmpty), !(weight.isEmpty) {
                    calculate(nil)
                }
            }
            textField.resignFirstResponder()
        }
        else { textField.resignFirstResponder() }
        return true
    }
    
    @IBAction func toggleAction(_ sender: UISwitch) {
        if toggleunit.isOn {
            //If text is already there, convert it to metric
            if heightfield.text != nil && !((heightfield.text!).isEmpty) {
                if let heightVal = Double(heightfield.text!) {
                    heightfield.text = String(format: "%.2f", heightVal * 0.0254)
                }
            }
            if weightfield.text != nil && !((weightfield.text!).isEmpty) {
                if let weightVal = Double(weightfield.text!) {
                    weightfield.text = String(format: "%.2f", weightVal * 0.453592)
                }
            }
           
            else if lastCalculationType == 0 && heightfield.text != nil && !((heightfield.text!).isEmpty) && weightfield.text != nil && !((weightfield.text!).isEmpty) {
                calculate(nil)
            }
            heightfield.placeholder = "(m)"
            weightfield.placeholder = "(kg)"
        }
        else {
            //If text is already there, convert it to imperial
            if heightfield.text != nil && !((heightfield.text!).isEmpty) {
                if let heightVal = Double(heightfield.text!) {
                    heightfield.text = String(format: "%.2f", heightVal / 0.0254)
                }
            }
            if weightfield.text != nil && !((weightfield.text!).isEmpty) {
                if let weightVal = Double(weightfield.text!) {
                    weightfield.text = String(format: "%.2f", weightVal / 0.453592)
                }
            }
            else if lastCalculationType == 0 && heightfield.text != nil && !((heightfield.text!).isEmpty) && weightfield.text != nil && !((weightfield.text!).isEmpty) {
                calculate(nil)
            }
            heightfield.placeholder = "(in)"
            weightfield.placeholder = "(lbs)"
        }
    }
    
    @IBAction func submit(_ sender: UIButton?) {
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
                      "height": heightfield.text! as String,
                      "bmi": resultBmi.text! as String]
        ref.child(key!).setValue(avatar)
    }

    @IBAction func calculate(_ sender: UIButton?) {
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
            descriptlabel.text = descriptor
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
