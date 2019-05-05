//
//  TabBarItemType.swift
//  EPubReader
//
//  Created by Hsiao Ai LEE on 09/02/2018.
//  Copyright © 2018 Hsiao Ai LEE. All rights reserved.
//

import UIKit

enum TabBarItemType {
    
    case today, discover, propose, watch, me
}

extension TabBarItemType {
   
    var title: String {
       
        switch self {
        case .today:
            
            return "Today"
        case .discover:
            
            return "Discover"
        case .propose:
            
            return ""
        case .watch:
            
            return "Watch"
        case .me:
            
            return "Me"
        }
    }
    
    var image: UIImage? {
        
        switch self {
        case .today:
            
            return UIImage(named: "home_off")
        case .discover:
            
            return UIImage(named: "discover_off")
        case .propose:
            
            return UIImage(named: "")
        case .watch:
            
            return UIImage(named: "watch_off")
        case .me:
            
            return UIImage(named: "me_off")
        }
    }
    
    var selectedImage: UIImage? {
        
        switch self {
        case .today:
            
            return UIImage(named: "home_on")
        case .discover:
            
            return UIImage(named: "discover_on")
        case .propose:
            
            return UIImage(named: "")
        case .watch:
            
            return UIImage(named: "watch_on")
        case .me:
            
            return UIImage(named: "me_on")
        }
    }
}
