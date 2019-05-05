//
//  Storyboard.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/4.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import UIKit

public protocol StoryboardInit { }

public extension StoryboardInit where Self: UIViewController {
    
    // MARK: - Storyboard Init
    
    static func storyboardInit() -> Self {
        
        // swiftlint:disable force_cast
        
        return UIStoryboard(
            name: String(describing: self),
            bundle: Bundle(for: self)
        ).instantiateInitialViewController() as! Self
        
        // swiftlint:enable force_cast
    }
}
