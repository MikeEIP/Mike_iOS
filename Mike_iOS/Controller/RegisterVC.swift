//
//  RegisterVC.swift
//  Mike_iOS
//
//  Created by Jeremy on 14/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import UIKit
import DatePickerDialog

class RegisterVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var birthdate: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        Properties.sharedInstance.setButtonStyle(button: createAccountButton)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func datePickerTapped() {
        DatePickerDialog().show("DatePicker", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "MM/dd/yyyy"
                self.birthdate.setTitle(formatter.string(from: dt), for: .normal)
            }
        }
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        
        guard let username = usernameTextField.text , usernameTextField.text != "" else { return }
        
        guard let password = passwordTextField.text , passwordTextField.text != "" else { return }
        
        guard let birthday = birthdate.titleLabel?.text, birthdate.titleLabel?.text != "" else { return }
        
        AuthService.sharedInstance.registerUser(username: username, password: password, birthdate: birthday) { (success) in
            self.createAccountButton.setTitle("", for: .normal)
            self.createAccountButton.loadingIndicator(show: true)
            if success {
                print("User \(username) created")
                self.createAccountButton.setTitle("Success", for: .normal)
                self.createAccountButton.loadingIndicator(show: false)
            } else {
                print("Can't creat User")
            }
        }
    }
    
}
