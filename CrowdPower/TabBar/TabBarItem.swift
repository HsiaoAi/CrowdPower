//
//  TabBarItem.swift
//  EPubReader
//
//  Created by Hsiao Ai LEE on 09/02/2018.
//  Copyright © 2018 Hsiao Ai LEE. All rights reserved.
//

import UIKit

final class TabBarItem: UITabBarItem {
    
    var itemType: TabBarItemType?
    
    init(itemType: TabBarItemType) {
       
        super.init()
        self.itemType = itemType
        self.title = itemType.title
        self.image = itemType.image
        self.selectedImage = itemType.selectedImage
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
}
