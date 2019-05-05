//
//  TabBarController.swift
//  EPubReader
//
//  Created by Hsiao Ai LEE on 09/02/2018.
//  Copyright © 2018 Hsiao Ai LEE. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    required init?(coder aDecoder: NSCoder) {
       
        super.init(coder: aDecoder)
    }
        
    init(itemTypes: [TabBarItemType]) {
        
        super.init(nibName: nil, bundle: nil)
        
        let viewControllers = itemTypes.map(TabBarController.prepare)
        
        setViewControllers(viewControllers, animated: false)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupUI()
        setupProposeButton()
    }
}

// MARK: - Builders

private extension TabBarController {
    
    static func prepare(itemType: TabBarItemType) -> UIViewController {
        
        let tabBarItem = TabBarItem(itemType: itemType)
       
        switch itemType {
        case .today:

            let todayViewController = NavigationViewController(rootViewController: TodayViewController.storyboardInit()) 
           
            todayViewController.tabBarItem = tabBarItem
           
            return todayViewController
        case .discover:
            
            let discoverViewController = NavigationViewController(
                rootViewController: DiscoveryViewController.storyboardInit()
            )
            discoverViewController.tabBarItem = tabBarItem
            
            return discoverViewController
        case .propose:
            
            let proposeViewController = UIViewController()
            proposeViewController.tabBarItem = tabBarItem
            
            return proposeViewController
        case .watch:
            
            let watchViewController = NavigationViewController(rootViewController: WatchViewController.storyboardInit()) 
            watchViewController.tabBarItem = tabBarItem
            
            return watchViewController
        case .me:
            
            let arViewController = NavigationViewController(rootViewController: ARViewController.storyboardInit())
            
            arViewController.tabBarItem = tabBarItem
            
            return arViewController
        }
    }
    
    func setupUI() {
        
        tabBar.tintColor = .black
    }
    
    func setupProposeButton() {
        
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "proposal"), for: .normal)
        button.frame.size = CGSize(width: 55, height: 55)
        button.layer.masksToBounds = true
        button.center = CGPoint(
            x: UIScreen.main.bounds.width / 2,
            y: UIScreen.main.bounds.height - 62
        )
        button.addTarget(self, action: #selector(touchUpInsideAddButton), for: .touchUpInside)
        view.addSubview(button)
        view.bringSubviewToFront(button)
    }
    
    @objc func touchUpInsideAddButton() {
        
        let proposalViewController = ProposalViewController.storyboardInit()
        
        present(proposalViewController, animated: true, completion: nil)
    }
}
