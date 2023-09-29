
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

//All text fields
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
        // initiating place holders
        firstName.placeholder = "First Name"
        lastName.placeholder = "Last Name"
        country.placeholder = "Country"
        age.placeholder = "Age"
        setLabelMessages()
        //labels are hidden initially
        errorMessage.isHidden = true
        successMessage.isHidden = true
    }
    
    //Method to set messages for labels
    func setLabelMessages(){
        errorMessage.text = "Complete the missing info"
        successMessage.text = "Successfully submitted!"
    }
    
    //Method called when Add button is pressed and result displayed in text box
    @IBAction func addDetails(_ sender: Any) {
        validateFields()
        updateSummary()
    }
    
    //Clears text boxes and sets error messages hidden
    @IBAction func clearFields(_ sender: Any) {
        clearAllFields()
        successMessage.isHidden = true
        errorMessage.isHidden = true
    }
    
    //Method called when submit button is pressed
    //Appropriate validations done and error or success labels are displayedS
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
    
    //Updates text box in UI with user input values
    //success and error messages are hidden
    func updateSummary(){
       let myText = "\n\t Full Name : \n\t \(firstName.text) \(lastName.text)\n\t Country :\(country.text)\n\t Age : \(age.text)\n isCompletelyFilled:\(isCompletelyFilled)"
        clearAllFields()
        summary.text = myText
        successMessage.isHidden = true
        errorMessage.isHidden = true
        return
        
    }
    //clears all fields
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
    //validating user inputs	
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

	
