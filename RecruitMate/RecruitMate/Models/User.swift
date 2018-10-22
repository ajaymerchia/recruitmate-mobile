//
//  User.swift
//  RecruitMate
//
//  Created by Isabella Lau on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class User {
    var name: String!
    var email: String!
    
    var boarduids: [String]!
    
    var profilePicture: UIImage!
    
    init(name: String, email: String, boarduids: [String]) {
        self.name = name
        self.email = email
        self.boarduids = boarduids
    }
}
