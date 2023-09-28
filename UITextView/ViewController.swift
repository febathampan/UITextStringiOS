
//
//  ViewController.swift
//  UITextView
//
//  Created by user234888 on 9/25/23.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet weak var summary: UITextView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var fistNameErrorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstName.placeholder = "First Name"
        lastName.placeholder = "Last Name"
        country.placeholder = "Country"
        age.placeholder = "Age"
        summary.text = ""
        
    }
    
    
    
    
    @IBAction func addDetails(_ sender: Any) {
        if validateFields()
            updateSummary()
    }
    func updateSummary(){
        summary.text = "Summary: \n\t \(firstName.text) \(lastName.text)\n\t \(country.text)\n\t\(age.text)"
    }
    func validateFields(){
        if firstName.text.isEmpty{
            fistNameErrorLabel.setNeedsDisplay()
        }
    }
}

	
