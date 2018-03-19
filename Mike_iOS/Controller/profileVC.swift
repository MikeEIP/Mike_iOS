//
//  profileVC.swift
//  Mike_iOS
//
//  Created by Jordan Vacca on 16/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import UIKit

class profileVC: UIViewController {

    @IBOutlet weak var profilImg: UIImageView!
    @IBOutlet weak var followBtn: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupProfil()

    }


    private func setupProfil()
    {
        profilImg.layer.cornerRadius = self.profilImg.frame.size.width / 2
        profilImg.clipsToBounds = true
        profilImg.layer.borderWidth = 2
        profilImg.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        followBtn.layer.cornerRadius = followBtn.frame.size.height / 2
        followBtn.clipsToBounds = true
    }

}
