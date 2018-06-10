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
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var birthdate: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var mismatchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        Properties.sharedInstance.setButtonStyle(button: createAccountButton)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func datePickerTapped() {
        DatePickerDialog().show("Select your birthdate", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy"
                self.birthdate.setTitle(formatter.string(from: dt), for: .normal)
            }
            let dateOfBirth = date
            
            let today = NSDate()
            
            let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
            
            let age = gregorian.components([.year], from: dateOfBirth!, to: today as Date, options: [])
            
            if age.year! < 16 {
                self.setAlertAction(message: "You must be 16 years old.")
                self.datePickerTapped()
            }
        }
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        
        guard let email = emailTextField.text, emailTextField.text != "", emailTextField.text?.isEmail == true else {
            self.emailTextField.shake()
            self.setAlertAction(message: "Please enter a valid e-mail")
            return
        }
        guard let username = usernameTextField.text, usernameTextField.text != "" else { return }
        
        guard let password = passwordTextField.text, passwordTextField.text != "", passwordTextField.text?.isASecurePassword == true else {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
                self.passwordTextField.shake()
                self.confirmPasswordTextField.shake()
                self.setAlertAction(message: "Password must be at leat 8 characters containing a-z, A-Z, 0-6")
            }, completion: nil)
            return
        }
        
        guard let birthday = birthdate.titleLabel?.text, birthdate.titleLabel?.text != "" else { return }
        
        guard let _ = confirmPasswordTextField.text, confirmPasswordTextField.text == passwordTextField.text else {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
                self.mismatchLabel.alpha = 1
                self.passwordTextField.shake()
                self.confirmPasswordTextField.shake()
            }, completion: nil)
            return
        }
        
        AuthService.sharedInstance.registerUser(email: email, username: username, password: password, birthdate: birthday) { (success) in
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
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
    
    @IBAction func questionPressed(_ sender: Any) {
        performSegue(withIdentifier: "toQuestions", sender: nil)
    }
    
    @IBAction func unwind(segue:UIStoryboardSegue) { }
    
    @IBAction func dismissVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setAlertAction(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            NSLog("OK Pressed")
        }
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
