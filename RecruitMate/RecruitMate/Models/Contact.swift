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
    
    var id: String!
    var name: String!
    var email: String!
    var position: String!
    
    init(name: String, email: String, position: String) {
        self.id = Utils.uuid()
        self.name = name
        self.email = email
        self.position = position
    }
    
    init(key: String, firebaseStruct: [String: Any?]) {
        self.id = key
        self.name = (firebaseStruct["name"] as! String)
        self.email = (firebaseStruct["email"] as! String)
        self.position = (firebaseStruct["position"] as! String)
    }
    
}
