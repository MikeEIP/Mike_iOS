//
//  ExerciceVC.swift
//  Mike_iOS
//
//  Created by Jordan Vacca on 21/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import UIKit
import CoreMotion
@IBDesignable
class ExerciceVC: UIViewController
{
    @IBOutlet weak var continueBtn: UIButton!
    let counter = CircleGraph()
    var nbPompe = 0.0
    var lblCount = 0
    var motion = CMMotionManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        continueBtn.layer.cornerRadius = continueBtn.frame.size.height / 2
        continueBtn.clipsToBounds = true
        counter.setupCG(View: self.view)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        counter.setupPercentageLabel(View: self.view, LblName: String(lblCount) + "/10")
        
        motion.accelerometerUpdateInterval = 0.1
        
        motion.gyroUpdateInterval = 0.5
        
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
        lblCount = lblCount + 1
        counter.refreshingTxt(View: self.view, newLbl: (String(lblCount) + "/10"))
        if nbPompe == 10
        {
            counter.percentageLabel.textColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            counter.animatePulsatingLayer()
        }
        
        
    }
}
