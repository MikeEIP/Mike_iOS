//
//  LoginVC.swift
//  Mike_iOS
//
//  Created by Jeremy on 13/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        Properties.sharedInstance.setButtonStyle(button: loginButton)
        Properties.sharedInstance.setButtonStyle(button: registerButton)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func loginPressed(_ sender: Any) {
        AuthService.sharedInstance.accessToken = ""
        print("Previous token: \(AuthService.sharedInstance.accessToken)")
        guard let username = usernameTextField.text , usernameTextField.text != "" else {
            return
        }
        
        guard let password = passwordTextField.text , passwordTextField.text != "" else {
            return
        }
        
        AuthService.sharedInstance.loginUser(username: username, password: password) { (success) in
            if success {
                print("User logged in with token : \(AuthService.sharedInstance.accessToken)")
                self.errorLabel.alpha = 0
            } else {
                UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
                    self.errorLabel.alpha = 1
                    self.usernameTextField.shake()
                    self.passwordTextField.shake()
                }, completion: nil)
            }
        }
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        performSegue(withIdentifier: "toRegister", sender: nil)
        print("Register Tapped")
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
    }
    
}
