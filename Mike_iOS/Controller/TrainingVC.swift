//
//  TrainingVC.swift
//  Mike_iOS
//
//  Created by Jordan Vacca on 19/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import UIKit

class TrainingVC: UIViewController {

    @IBOutlet weak var trainingBtn: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        trainingBtn.layer.cornerRadius = trainingBtn.frame.size.height / 2
        trainingBtn.clipsToBounds = true
       
        
    }
    
    
    @IBAction func trainingBtnPressed(_ sender: Any)
    {
        
    }
    
}
