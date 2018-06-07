//
//  Extensions.swift
//  Mike_iOS
//
//  Created by Jordan Vacca on 21/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
   // static let backgroundColor = UIColor.rgb(r: 21, g: 22, b: 33)
    static let outlineStrokeColor = UIColor.rgb(r: 234, g: 46, b: 111)
    static let trackStrokeColor = UIColor.rgb(r: 56, g: 25, b: 49)
    static let pulsatingFillColor = UIColor.rgb(r: 86, g: 30, b: 63)
}

extension String {
    
    /// Should Have :
    ///
    /// * >= 8 chars
    /// * >= 1 digit
    /// * >= 1 letter
    /// * (>= 1 capitalized letter && >= 1 lowercase letter) OR >= 1 special char
    public var isASecurePassword: Bool {
        
        if  self.count < 8 ||
            self.rangeOfCharacter(from: CharacterSet.letters) == nil ||
            self.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil {
            return false
        }
        
        return ((self.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil && self.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil) ||
            self.rangeOfCharacter(from: CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789").inverted) != nil)
    }
}

extension String {
    public var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

