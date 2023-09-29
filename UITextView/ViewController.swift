
//
//  ViewController.swift
//  UITextView
//
//  Created by user234888 on 9/25/23.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var summary: UITextView!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var successMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstName.placeholder = "First Name"
        lastName.placeholder = "Last Name"
        country.placeholder = "Country"
        age.placeholder = "Age"
        //summary.text = ""
        setLabelMessages()
        errorMessage.isHidden = true
        successMessage.isHidden = true
                
    }
    
    func setLabelMessages(){
        errorMessage.text = "Complete the missing info"
        successMessage.text = "Successfully submitted!"
    }
    @IBAction func addDetails(_ sender: Any) {
        validateFields()
        updateSummary()
    }
    @IBAction func clearFields(_ sender: Any) {
        clearAllFields()
        successMessage.isHidden = true
        errorMessage.isHidden = true
    }
    @IBAction func submitForm(_ sender: Any) {
        if summary.text.isEmpty {
                    errorMessage.isHidden = false
                    successMessage.isHidden = true
                }
                else {
                    successMessage.isHidden = false
                    errorMessage.isHidden = true
                }
    }
    func updateSummary(){
       let myText = "Summary: \n\t \(firstName.text) \(lastName.text)\n\t \(country.text)\n\t\(age.text)"
        summary.text = myText;
        clearAllFieldsExceptSummary()
        successMessage.isHidden = true
        errorMessage.isHidden = true
        
    }
    func clearAllFields(){
       clearAllFieldsExceptSummary()
        summary.text?.removeAll()
    }
    func clearAllFieldsExceptSummary(){
        firstName.text?.removeAll()
        lastName.text?.removeAll()
        age.text?.removeAll()
        country.text?.removeAll()
    }
    
    func validateFields(){
        guard let fName = firstName.text,
              let lName = lastName.text,
              let country_name = country.text,
              let uAge = age.text,
              fName.isEmpty, !lName.isEmpty, !country_name.isEmpty, !uAge.isEmpty,
              let ageVal = Int(uAge)
        else {
            errorMessage.isHidden = false
            successMessage.isHidden = true
            return
        }
        
    }
            
}

	
