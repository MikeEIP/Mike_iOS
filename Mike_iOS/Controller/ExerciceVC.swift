//
//  ExerciceVC.swift
//  Mike_iOS
//
//  Created by Jordan Vacca on 21/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import UIKit
import CoreMotion

class ExerciceVC: UIViewController
{
    @IBOutlet weak var continueBtn: UIButton!
    let counter = CircleGraph()
    var nbPompe = 0.0
    var motion = CMMotionManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        continueBtn.layer.cornerRadius = continueBtn.frame.size.height / 2
        continueBtn.clipsToBounds = true
        counter.setupCG(View: self.view)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        counter.setupPercentageLabel(View: self.view)
        
        motion.accelerometerUpdateInterval = 0.1
        
        motion.gyroUpdateInterval = 0.6
        
        motion.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            var tilted = 0
            if let myData = data
            {
                if myData.rotationRate.x > 0.5
                {
                    self.handleTap()
                    print("Tilted \(tilted) time")
                }
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc private func handleTap() {
        print("Attempting to animate stroke")
        
        counter.pompeCounter()
        nbPompe = nbPompe + 1
        if nbPompe == 11
        {
            counter.animatePulsatingLayer()
        }
       
        
    }
}
