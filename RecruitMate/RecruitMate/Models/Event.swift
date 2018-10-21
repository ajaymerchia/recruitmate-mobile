//
//  Event.swift
//  RecruitMate
//
//  Created by Isabella Lau on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation

class Event {
    var name: String!
    var date: String!
    var time: String!
    var location: String!
    
    init(name: String, date: String, time: String, location: String) {
        self.name = name
        self.date = date
        self.time = time
        self.location = location
    }
}
