
//
//  Proposal.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/4.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

public enum Status {
    
    case new, check, vote, result(Bool), response(Bool, String), ongoing(Double)
}

public enum Category: String {
    
    case traffic, environmental, urban, hygiene, none
}

class Proposal {
    
    var id: String
    var title: String
    var description: String
    var details: String
    var voters: Double
    var statue: Status
    var category: Category
    var commnets: Comment
    
    // MARK: - Locations
    
    var lat: Double?
    var lng: Double?
    
    var agreeRate: String {
        
        let rate = (voters / Constants.voteThreshold) * 100
        
        return "\(rate) %"
    }
}
