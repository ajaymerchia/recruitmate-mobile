//
//  Email.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
class Email {
    var from: String!
    var sender: String!
    var subject: String!
    var body: String!
    
    var description: String {
        return "From: \(from ?? "")\nSender: \(sender ?? "")\nSubject: \(subject ?? "")\nBody: \(body ?? "")"
    }
    
    init(from: String, sender: String, subject: String, msg: String) {
        self.from = from
        self.sender = sender
        self.body = msg
        self.subject = subject
    }
    
}
