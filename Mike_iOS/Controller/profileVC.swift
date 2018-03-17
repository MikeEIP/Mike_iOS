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
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupProfil()

    }


    private func setupProfil()
    {
        self.profilImg.layer.cornerRadius = self.profilImg.frame.size.width / 2
        self.profilImg.clipsToBounds = true
        self.profilImg.layer.borderWidth = 2
        self.profilImg.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

}
