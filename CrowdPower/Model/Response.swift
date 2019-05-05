//
//  Response.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/4.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import Foundation

public class Response {
    
    public var isAgreed: Bool
    public var date: Date
    public var description: String
    public var responder: String
    
    public init(isAgreed: Bool, date: Date, description: String, responder: String) {
        
        self.isAgreed = isAgreed
        self.date = date
        self.description = description
        self.responder = responder
    }
}
