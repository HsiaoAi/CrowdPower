
//
//  Proposal.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/4.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import Foundation

public enum Status {
    
    case new, check, vote, result(Bool), response, ongoing(Double)
}

public enum Category: String {
    
    case traffic = "Traffic"
    case environmental = "Environmental Protect"
    case urban = "Urban"
    case hygiene = "Hygiene"
    case none = ""
}

public class Proposal {
    
    public var id: Int
    public var title: String
    public var description: String
    public var details: String
    public var voters: Double
    public var statue: Status
    public var category: Category
    public var commnets: [Comment] = []
    public var startDate: Date
    public var response: Response?
    public var location: String
    public var imageName: String?
    
    // MARK: - Locations
    
    public var lat: Double?
    public var lng: Double?
    
    public var agreeRate: Float {
        
        let rate = (Float((voters / Constants.voteThreshold) * 100))
        
        let fullRate: Float = 100
        
        return (rate > 100.0) ? fullRate : rate
    }
    
    public init(
        id: Int,
        title: String,
        description: String,
        details: String,
        voters: Double,
        statue: Status,
        category: Category,
        commnets: [Comment] = [],
        startDate: Date,
        response: Response?,
        location: String,
        lat: Double?,
        lng: Double?,
        imageName: String?
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.details = details
        self.voters = voters
        self.statue = statue
        self.category = category
        self.commnets = commnets
        self.startDate = startDate
        self.response = response
        self.lat = lat
        self.lng = lng
        self.location = location
        self.imageName = imageName
    }
}
