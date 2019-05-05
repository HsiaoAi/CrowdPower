//
//  WatchCell.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/5.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import UIKit

class WatchCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var barView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // MARK: - Card View
        
        view.layer.shadowColor = UIColor(red: 0.21, green: 0.34, blue: 0.43, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 6
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.masksToBounds = true
        view.clipsToBounds = false
        view.layer.cornerRadius = 6
        
        photoImageView.layer.cornerRadius = 6
        photoImageView.clipsToBounds = false
        photoImageView.layer.masksToBounds = true
    }
    
    func setup(_ image: UIImage?) {
        
        photoImageView.image = image
    }
        
    func updateBarView(isHidden: Bool, color: UIColor) {
        
        barView.isHidden = isHidden
        barView.backgroundColor = color
    }
}
