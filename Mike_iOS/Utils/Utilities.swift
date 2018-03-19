//
//  Utilities.swift
//  Mike_iOS
//
//  Created by Jeremy on 13/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import Foundation
import UIKit

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL Constants
let BASE_URL = "https://mike.arrogant.space/v1/"
let URL_LOGIN = "\(BASE_URL)login"
let URL_REGISTER = "\(BASE_URL)user"

//Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

//User Defaults
let TOKEN_SESSION = "token"
let USER_EMAIL = "userEmail"
let FIRST_NAME = "firstName"
let LAST_NAME = "lastName"
let COUNTRY = "France"
let CITY = "Nice"
let LANGUAGE = "fr_FR"
let XP = 0
let MUSCLOR = 0
let PROFILE_PICTURE = "profilePicture"
let LOGGED_IN = "loggedIn"

extension UIButton {
    func loadingIndicator(show: Bool) {
        if show {
            let indicator = UIActivityIndicatorView()
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            indicator.center = CGPoint(x: buttonWidth / 2, y: buttonHeight / 2)
            self.addSubview(indicator)
            indicator.startAnimating()
        } else {
            for view in self.subviews {
                if let indicator = view as? UIActivityIndicatorView {
                    indicator.stopAnimating()
                    indicator.removeFromSuperview()
                }
            }
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UITextField {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}

