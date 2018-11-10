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
        values["deadline"] = deadline?.timeIntervalSince1970
        return values
    }
    
    var id: String!
    var title: String!
    var description: String!
    var deadline: Date?
    
    init(title: String, description: String, deadline: Date? = nil) {
        self.id = Utils.uuid()
        self.title = title
        self.description = description
        self.deadline = deadline
    }
    
    init(key: String, firebaseStruct: [String: Any?]) {
        self.id = key
        self.title = (firebaseStruct["title"] as! String)
        self.deadline = Date(timeIntervalSince1970: TimeInterval(exactly: firebaseStruct["deadline"] as! Int)!)
        self.description = (firebaseStruct["description"] as! String)
    }
    
    
}
