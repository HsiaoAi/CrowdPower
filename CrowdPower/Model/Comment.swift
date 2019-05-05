//
//  Comment.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/4.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import Foundation

public class Comment {
    
    var proposalID: Int
    var name: String
    var content: String
    var date: Date
    
    public init(proposalID: Int, name: String, content: String, date: Date) {
        
        self.proposalID = proposalID
        self.name = name
        self.content = content
        self.date = date
    }
}
