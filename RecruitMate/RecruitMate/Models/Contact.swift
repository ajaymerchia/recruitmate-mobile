//
//  Contact.swift
//  RecruitMate
//
//  Created by Isabella Lau on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class Contact: FirebasePushable {
    func createPushable() -> [String : Any?] {
        var values: [String : Any?] = [:]
        values["name"] = name
        values["email"] = email
        values["position"] = position
        return values
    }
    
    var name: String!
    var email: String!
    var position: String!
    
    init(name: String, email: String, position: String) {
        self.name = name
        self.email = email
        self.position = position
    }
}
