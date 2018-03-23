//
//  questionnaireVC.swift
//  Mike_iOS 
//
//  Created by Jordan Vacca on 22/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import UIKit

class QuestionnaireVC: UIViewController
{
    @IBOutlet weak var poidsLbl: UILabel!
    @IBOutlet weak var poidsPb: UISlider!
    
    @IBOutlet weak var tailleLbl: UILabel!
    @IBOutlet weak var taillePb: UISlider!
    
    @IBOutlet weak var activiteLbl: UILabel!
    @IBOutlet weak var activitePb: UISlider!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    let tableau = ["Jamais","Un peu","De temps en temps","Régulièrement","Quotidiennement"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        refreshingPoid()
        refreshingSize()
        refreshingActivite()
        
        nextBtn.layer.cornerRadius = nextBtn.frame.size.height / 2
        nextBtn.clipsToBounds = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle  {
        return .lightContent
    }
    
    func refreshingActivite()
    {
        let activite = activitePb.value
        
        activiteLbl.text = tableau[Int(activite)]
    }
    
    func refreshingPoid()
    {
        let poid = poidsPb.value
        poidsLbl.text = String(Int(poid)) + "" + "kg"
    }
    
    func refreshingSize()
    {
        let size = taillePb.value
        tailleLbl.text = String(Int(size)) + "" + "cm"
    }
    
    
    //ACTION SLIDER
    
    
    @IBAction func sliderPoidValue(_ sender: UISlider)
    {
        refreshingPoid()
    }
    
    @IBAction func sliderSizeValue(_ sender: UISlider)
    {
        refreshingSize()
    }
    
    @IBAction func sliderActiviteValue(_ sender: UISlider)
    {
        refreshingActivite()
    } 
}
