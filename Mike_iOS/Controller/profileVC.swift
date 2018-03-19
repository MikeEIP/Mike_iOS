//
//  profileVC.swift
//  Mike_iOS
//
//  Created by Jordan Vacca on 16/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import UIKit

class profileVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var profilImg: UIImageView!
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var friendList: UICollectionView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupProfil()
        friendList.delegate = self
        friendList.dataSource = self

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

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = friendList.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath)
        return cell
    }
    
    
}
