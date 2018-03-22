//
//  ExerciceVC.swift
//  Mike_iOS
//
//  Created by Jordan Vacca on 21/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import UIKit

class ExerciceVC: UIViewController
{
    @IBOutlet weak var continueBtn: UIButton!
    let counter = CircleGraph()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        continueBtn.layer.cornerRadius = continueBtn.frame.size.height / 2
        continueBtn.clipsToBounds = true
        counter.setupCG(View: self.view)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        counter.setupPercentageLabel(View: self.view)
    }
    
    @objc private func handleTap() {
        print("Attempting to animate stroke")

        counter.animateCircle()
    }
}
