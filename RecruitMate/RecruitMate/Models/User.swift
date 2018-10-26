//
//  User.swift
//  RecruitMate
//
//  Created by Isabella Lau on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class User {
    var first: String!
    var last: String!
    var fullname: String {
        return "\(first ?? "") \(last ?? "")"
    }
    var email: String!
    
    var boarduids: [String]!
    var boards: [String: Board] = [:]
    var defaultBoardID: String!
    
    var profilePicture: UIImage!
    
    static let SAMPLE_USER = User(first: "Oski", last: "Dirks", email: "publicfunds@berkeley.edu", boarduids: ["randomBoardsYeeet234"], favorite: "randomBoardsYeeet234")
    
    init(first: String, last: String, email: String, boarduids: [String], favorite: String, _ testing: Bool = false) {
        self.first = first
        self.last = last
        self.email = email
        self.boarduids = boarduids
        self.defaultBoardID = favorite
        if testing {
            self.boards.updateValue(Board(title: "randomBoardsYeeet", uuid: "randomBoardsYeeet234"), forKey: "randomBoardsYeeet234")
        }
    }

    
    
    init(firebaseStruct: [String: Any?]) {
        
    }
    
    
}
