//
//  WatchViewController.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/5.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import UIKit

class WatchViewController: UIViewController, StoryboardInit {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        setupUI()
    }

    func setupUI() {
        
        // MARK: - Navigation
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Watch Progress"
    }
}
