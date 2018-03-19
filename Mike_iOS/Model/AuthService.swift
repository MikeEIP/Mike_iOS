//
//  AuthService.swift
//  Mike_iOS
//
//  Created by Jeremy on 14/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let sharedInstance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var accessToken: String {
        get {
            return defaults.value(forKey: TOKEN_SESSION) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_SESSION)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN)
        }
    }
    
    func loginUser(username: String, password: String, completion: @escaping CompletionHandler) {
        
        let body: [String: Any] = [
            "username": username,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                //SwiftyJSON
                guard let data = response.data else { return }
                do {
                    let json = try JSON(data: data)
                    self.userEmail = json["username"].stringValue
                    self.accessToken = json["access_token"].stringValue
                    completion(true)
                } catch {
                    debugPrint(error)
                    completion(false)
                }
            } else {
                self.isLoggedIn = false
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func registerUser(username: String, password: String, birthdate: String, completion: @escaping CompletionHandler) {
        
        let body: [String: Any] = [
            "username": username,
            "lastname": LAST_NAME,
            "firstname": FIRST_NAME,
            "email": USER_EMAIL,
            "birthday": birthdate,
            "country": COUNTRY,
            "city": CITY,
            "language": LANGUAGE,
            "xp": XP,
            "musclor": MUSCLOR,
            "profilPicture": PROFILE_PICTURE,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
