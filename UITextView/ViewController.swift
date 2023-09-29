
//
//  ViewController.swift
//  UITextView
//
//  Created by user234888 on 9/25/23.
// Assignment 3 - UI Text View - Section 5
// Author: Feba Thampan - 8953147
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
	var isCompletelyFilled = 0
    
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
        summary.text = "Is Complete: \(isCompletelyFilled)"
        if isCompletelyFilled>0 {
                    errorMessage.isHidden = true
                    successMessage.isHidden = false
                }
                else {
                    successMessage.isHidden = true
                    errorMessage.isHidden = false
                }
    }
    func updateSummary(){
       let myText = "\n\t Full Name : \n\t \(firstName.text) \(lastName.text)\n\t Country :\(country.text)\n\t Age : \(age.text)\n isCompletelyFilled:\(isCompletelyFilled)"
        clearAllFields()
        summary.text = myText
        successMessage.isHidden = true
        errorMessage.isHidden = true
        return
        
    }
    func clearAllFields(){
       clearAllFieldsExceptSummary()
        summary.text?.removeAll()
        isCompletelyFilled *= 0
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
              !fName.isEmpty, !lName.isEmpty, !country_name.isEmpty, !uAge.isEmpty,
              let ageVal = Int(uAge)
        else {
            errorMessage.isHidden = false
            successMessage.isHidden = true
            return
        }
        isCompletelyFilled += 1
        return
    }
            
}

	
