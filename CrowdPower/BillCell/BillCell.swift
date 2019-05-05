//
//  BillCell.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/4.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import UIKit

class BillCell: UITableViewCell, NibLoadableView {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var agreeRateLabel: UILabel!
    @IBOutlet weak var votersLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var isFollowed: Bool = false
  
    @IBAction func touchUpInsideFollowButton(_ sender: UIButton) {
        
        isFollowed.toggle()
        
        let image = isFollowed ?
            UIImage(named: "follow_on") :
            UIImage(named: "follow_off")
        
        sender.setImage(image, for: .normal)
    }
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        setupUI()
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        
        // MARK: - Card View

        cardView.layer.shadowColor = UIColor(red: 0.21, green: 0.34, blue: 0.43, alpha: 0.25).cgColor
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowRadius = 4
        cardView.layer.shadowOffset = CGSize(width: 0, height: 4)
        cardView.layer.masksToBounds = true
        cardView.clipsToBounds = false
        cardView.layer.cornerRadius = 8
        
        photoImageView.layer.cornerRadius = 8
        photoImageView.clipsToBounds = false
        photoImageView.layer.masksToBounds = true
        
        selectionStyle = .none
    }
    
    func setup(with proposal: Proposal) {
        
        titleLabel.text = proposal.title
        progressView.progress = (proposal.agreeRate / 100)
        agreeRateLabel.text = "\(Int(proposal.agreeRate)) %"
        categoryLabel.text = proposal.category.rawValue
        locationLabel.text = proposal.location
        
        if let name = proposal.imageName {
            
            photoImageView.image = UIImage(named: name) ?? UIImage(named: "demo_proposal")
        }
        
        let days = 60 - (-Int(proposal.startDate.timeIntervalSinceNow / (60*60*24)))
        
        daysLabel.text = "\(days)"
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        
        let amount = Int(proposal.voters)
        let formattedString = formatter.string(for: amount)
        
        votersLabel.text = formattedString
    }
}
