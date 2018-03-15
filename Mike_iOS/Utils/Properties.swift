//
//  Properties.swift
//  Mike_iOS
//
//  Created by Jeremy on 13/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import Foundation
import UIKit

class Properties {
    
    static let sharedInstance = Properties()
    
    func designUIButton(button: UIButton) {
        button.layer.cornerRadius = 5.0
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 4.0
    }
    
    func prepForAnimation(button: UIButton, view: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            button.frame.size.width = button.frame.size.height
            button.layer.cornerRadius = button.frame.size.height / 2
            button.setTitle("", for: .normal)
            button.center.x = view.frame.width / 2
            button.loadingIndicator(show: true)
        }, completion: nil)
    }
    
    func setButtonStyle(button: UIButton) {
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
