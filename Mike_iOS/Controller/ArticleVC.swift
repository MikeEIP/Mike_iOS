//
//  ArticleVC.swift
//  Mike_iOS
//
//  Created by Jordan Vacca on 21/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import UIKit

class ArticleVC: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var articleBackground: UIImageView!
    @IBOutlet weak var ArticleTxt: UITextView!
    @IBOutlet weak var nameProfile: UILabel!
    @IBOutlet weak var jobProfile: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var profileInfoView: UIView!
    
    @IBOutlet var superView: GradientView!
    @IBOutlet weak var likeBtn: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        textView.layer.cornerRadius = 8
        profileInfoView.layer.cornerRadius = 8
        likeBtn.setTitleColor(UIColor.lightGray, for: .normal)
        profileInfoView.layer.zPosition = 1
       
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func likeBtnPressed(_ sender: Any)
    {
        if likeBtn.titleLabel?.textColor == UIColor.lightGray
        {
            likeBtn.setTitleColor(UIColor.red, for: .normal)
            print("red")
        }
        else
        {
            likeBtn.setTitleColor(UIColor.lightGray, for: .normal)
            print("gray")
        }
        
    }
    
    @IBAction func backBtnPressed(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
}
