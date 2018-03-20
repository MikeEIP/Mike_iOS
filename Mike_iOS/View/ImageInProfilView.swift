//
//  ImageInProfilView.swift
//  Mike_iOS
//
//  Created by Jordan Vacca on 19/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import UIKit

class ImageInProfilView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var tableView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
      
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = tableView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath)
        return cell
    }
    
    
}
