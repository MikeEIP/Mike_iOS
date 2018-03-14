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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        setButtonStyle(button: loginButton)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setButtonStyle(button: UIButton) {
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
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
    
}
