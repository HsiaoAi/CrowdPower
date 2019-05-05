//
//  MeViewController.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/5.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import UIKit

class MeViewController: UIViewController, StoryboardInit {
    
    @IBOutlet weak var imageView: UIImageView!    
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var proposed: UIButton!
   
    @IBAction func tapPropose(_ sender: UIButton) {
        
        imageView.image = UIImage(named: "proposed")
        sender.setTitleColor(.black, for: .normal)
        sender.setTitle("Proposed 1", for: .normal)
        followBtn.setTitleColor(.gray, for: .normal)
        followBtn.setTitle("Follow", for: .normal)
    }

    @IBAction func tapFollow(_ sender: UIButton) {
        
        imageView.image = UIImage(named: "followMe")
        sender.setTitleColor(.black, for: .normal)
        proposed.setTitleColor(.gray, for: .normal)
        sender.setTitle("Follow 1", for: .normal)
        proposed.setTitle("Proposed", for: .normal)
    }
    
    override func viewDidLoad() {
       
        super.viewDidLoad()

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Gils's Power"
    }
}
