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
    //@IBOutlet weak var friendList: UICollectionView!
    @IBOutlet weak var userPhotosContainer: UIView!
    @IBOutlet weak var userAchievementsContainer: UIView!
    @IBOutlet weak var img1: CircleImage!
    @IBOutlet weak var img2: CircleImage!
    @IBOutlet weak var img3: CircleImage!
    @IBOutlet weak var img4: CircleImage!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupProfil()
        //friendList.delegate = self
        //friendList.dataSource = self
        //friendList.layer.cornerRadius = 5
        userAchievementsContainer.alpha = 0
        
        img1.layer.borderWidth = 2
        img1.layer.borderColor = #colorLiteral(red: 0.5647058824, green: 0.5607843137, blue: 0.5607843137, alpha: 1)
        img1.transform = img1.transform.rotated(by: CGFloat(M_PI_2))
        
        img2.layer.borderWidth = 2
        img2.layer.borderColor = #colorLiteral(red: 0.5647058824, green: 0.5607843137, blue: 0.5607843137, alpha: 1)
        
        img3.layer.borderWidth = 2
        img3.layer.borderColor = #colorLiteral(red: 0.5647058824, green: 0.5607843137, blue: 0.5607843137, alpha: 1)
        
        img4.layer.borderWidth = 2
        img4.layer.borderColor = #colorLiteral(red: 0.5647058824, green: 0.5607843137, blue: 0.5607843137, alpha: 1)
        img4.transform = img4.transform.rotated(by: CGFloat(M_PI_2))
        

    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private func setupProfil()
    {
        profilImg.layer.cornerRadius = self.profilImg.frame.size.width / 2
        profilImg.clipsToBounds = true
        profilImg.layer.borderWidth = 2
        profilImg.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        followBtn.layer.cornerRadius = followBtn.frame.size.height / 2
        followBtn.clipsToBounds = true
        
        followBtn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        followBtn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        followBtn.layer.shadowOpacity = 1.0
        followBtn.layer.shadowRadius = 0.0
        followBtn.layer.masksToBounds = false
    }

    /*func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = friendList.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath)
        return cell
    }*/
    
    @IBAction func showComponent(sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            UIView.animate(withDuration: 0.5, animations: {
                self.userPhotosContainer.alpha = 1
                self.userAchievementsContainer.alpha = 0
                self.userAchievementsContainer.isUserInteractionEnabled = false
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.userPhotosContainer.alpha = 0
                self.userAchievementsContainer.alpha = 1
                self.userPhotosContainer.isUserInteractionEnabled = false
            })
        }
    }
    
    @IBAction func followPressed(_ sender: Any) {
        performSegue(withIdentifier: "toWorkout", sender: nil)
    }
    
}
