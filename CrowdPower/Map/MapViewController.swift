//
//  MapViewController.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/5.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, StoryboardInit, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var images: [UIImage] = [
        UIImage(named: "mapCard1")!,
        UIImage(named: "mapCard2")!,
        UIImage(named: "mapCard1")!
    ]
    
    var isSwitched: Bool = false
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mapImageView: UIImageView!
    @IBAction func tapCloseBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func `switch`(_ sender: UIButton) {
        
        isSwitched.toggle()
        
        let image = isSwitched ?
            UIImage(named: "map2") :
            UIImage(named: "map1")
        
        mapImageView.image = image
        
        let indexPath: IndexPath = isSwitched ?  IndexPath(row: 1, section: 0) : IndexPath(row: 0, section: 0)
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return CGSize(width: 242, height: 215)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WatchCell", for: indexPath) as? WatchCell else {
            
            return UICollectionViewCell()
        }
        
        let image = images[indexPath.row]
        
        cell.setup(image)
        
        return cell
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        let firstCell = collectionView.cellForItem(
            at: IndexPath(row: 0, section: 0)
        ) as! WatchCell
        
        let secondCell = collectionView.cellForItem(
            at: IndexPath(row: 0, section: 0)
        ) as! WatchCell
        
        if isSwitched {
            
            secondCell.barView.isHidden = false
            firstCell.barView.isHidden = true
        } else {
            
            firstCell.barView.isHidden = false
            secondCell.barView.isHidden = true
        }
    }
}
