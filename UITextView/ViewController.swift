
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
    //typealias CLASS = ViewController


//All text fields
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var summary: UITextView!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var successMessage: UILabel!
    
	var isCompletelyFilled = false
    var infoAdded = ""
    
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
        isCompletelyFilled = validateFields()
        updateSummary()
        return
    }
    
    //Clears text boxes and sets error messages hidden
    @IBAction func clearFields(_ sender: Any) {
        clearAllFields()
        successMessage.isHidden = true
        errorMessage.isHidden = true
        return
    }
    
    //Method called when submit button is pressed
    //Appropriate validations done and error or success labels are displayedS
    @IBAction func submitForm(_ sender: Any) {
        if !infoAdded.isEmpty {
                errorMessage.isHidden = true
                successMessage.isHidden = false
                }
        else {
            successMessage.isHidden = true
            errorMessage.isHidden = false
        }
        infoAdded = ""
        return
    }
    
    //Updates text box in UI with user input values
    //success and error messages are hidden
    func updateSummary(){
        let fullName = "\(firstName.text ?? "") \(lastName.text ?? "")"
        let countryText = country.text ?? ""
        let ageText = age.text ?? ""
                
        let myText = "\n\t Full Name : \n\t \(fullName)\n\t Country : \(countryText)\n\t Age : \(ageText)"
        clearAllFields()
        summary.text = myText
        return
        
    }
    //clears all fields
    func clearAllFields(){
       clearAllFieldsExceptSummary()
        summary.text?.removeAll()
        isCompletelyFilled = false
        return
    }
    
    func clearAllFieldsExceptSummary(){
        firstName.text?.removeAll()
        lastName.text?.removeAll()
        age.text?.removeAll()
        country.text?.removeAll()
        return
    }
    //validating user input and updating text field
    func validateFields() -> Bool{
        guard let fName = firstName.text, !fName.isEmpty,
                      let lName = lastName.text, !lName.isEmpty,
                      let country_name = country.text, !country_name.isEmpty,
                      let uAge = age.text, !uAge.isEmpty, Int(uAge) != nil
        else {
            return false
        }
        infoAdded = "yes"
        return true
    }
            
}

	
