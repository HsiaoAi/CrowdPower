//
//  TodayViewController.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/5.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController, StoryboardInit, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        
        // MARK: - Navigation
        
        collectionView.contentInsetAdjustmentBehavior = .never
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Today"
        
        // MARK: - ColleciotView
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(
            UINib(nibName: "WatchCell", bundle: nil),
            forCellWithReuseIdentifier: "WatchCell"
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 186, height: 200.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WatchCell", for: indexPath) as? WatchCell else {
            
            return UICollectionViewCell()
        }
        
        return cell
    }
}
