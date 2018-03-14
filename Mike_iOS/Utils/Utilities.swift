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

//Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

//User Defaults
let TOKEN_SESSION = "token"
let USER_EMAIL = "userEmail"

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

