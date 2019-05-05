//
//  DetailViewController.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/4.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, StoryboardInit {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var phtoImageView: UIImageView!
    @IBOutlet weak var mapButton: UIButton!
    
    var isFollowed: Bool = false

    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func tapFollowButton(_ sender: UIButton) {
        
        isFollowed.toggle()
        
        let image = isFollowed ?
            UIImage(named: "follow_on") :
            UIImage(named: "follow_off")
        
        sender.setImage(image, for: .normal)
    }
    
    @IBAction func tapShareButton(_ sender: UIButton) {
        
        let activityVC = UIActivityViewController(
            activityItems: [
                UIImage(named: "demo_proposal2")!,
                "🙏 Let's support this proposal: Community and leisure center with facilities for Kraví hora",
                URL(string: "crowdPower://index")!
            ],
            applicationActivities: nil
        )

        present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func tapMapButton(_ sender: UIButton) {
        
        
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
