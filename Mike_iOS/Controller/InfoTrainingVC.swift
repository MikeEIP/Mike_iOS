//
//  InfoTrainingVC.swift
//  Mike_iOS
//
//  Created by Jordan Vacca on 19/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import UIKit

class InfoTrainingVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var beginTraining: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        beginTraining.layer.cornerRadius = beginTraining.frame.size.height / 2
        beginTraining.clipsToBounds = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath)
        return cell
    }
    
    @IBAction func backBtnPressed(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
}
