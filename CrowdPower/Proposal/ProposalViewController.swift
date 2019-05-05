//
//  ProposalViewController.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/5.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import UIKit

class ProposalViewController: UIViewController, StoryboardInit {
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var continueBtn: UIButton!
    @IBAction func tapCloseButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    var isChecked: Bool = false
    
    @IBAction func tapCheckBtn(_ sender: UIButton) {
        
        isChecked.toggle()
        
        let image = isChecked ?
            UIImage(named: "checked") :
            UIImage(named: "uncheck")
        
        sender.setImage(image, for: .normal)
        
        continueBtn.isEnabled = isChecked
        continueBtn.backgroundColor = isChecked ? UIColor(red: 0, green: 0.44, blue: 1, alpha: 1) : UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        continueBtn.tintColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        
        continueBtn.layer.cornerRadius = 7
        continueBtn.layer.masksToBounds = true
        continueBtn.clipsToBounds = false
    }
}
