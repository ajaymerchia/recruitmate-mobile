//
//  Task.swift
//  RecruitMate
//
//  Created by Isabella Lau on 11/10/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class Task {
    func createPushable() -> [String : Any?] {
        var values: [String : Any?] = [:]
        values["title"] = title
        values["description"] = description
        values["deadline"] = deadline
        return values
    }
    
    var title: String!
    var description: String!
    var deadline: String!
    
    init(title: String, description: String, deadline: String) {
        self.title = title
        self.description = description
        self.deadline = deadline
    }
}
