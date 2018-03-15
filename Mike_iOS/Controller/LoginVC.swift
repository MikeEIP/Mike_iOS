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
        Properties.sharedInstance.prepForAnimation(button: loginButton, view: self.view)
        
        guard let username = usernameTextField.text , usernameTextField.text != "" else {
            return
        }
        
        guard let password = passwordTextField.text , passwordTextField.text != "" else {
            return
        }
        
        AuthService.sharedInstance.loginUser(username: username, password: password) { (success) in
            if success {
                print("User logged in with token : \(AuthService.sharedInstance.accessToken)")
            }
        }
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        performSegue(withIdentifier: "toRegister", sender: nil)
        print("Register Tapped")
    }
    
}
