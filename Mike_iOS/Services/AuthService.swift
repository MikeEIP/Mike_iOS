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
                } catch {
                    debugPrint(error)
                }
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
