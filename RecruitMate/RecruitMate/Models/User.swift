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
    
    var boards: [String: Board] = [:]
    var defaultBoardID: String!
    
    var profilePicture: UIImage!
    
    static let SAMPLE_USER = User(first: "Oski", last: "Dirks", email: "publicfunds@berkeley.edu", boards: ["randomBoardsYeeet234": Board.DEFAULT_BOARD], favorite: "randomBoardsYeeet234", testing: true)
    
    init(first: String, last: String, email: String, boards: [String: Board], favorite: String, testing: Bool = false) {
        self.first = first
        self.last = last
        self.email = email
        self.boards = boards
        self.defaultBoardID = favorite
        if testing {
            self.boards[favorite] = Board(title: "Job Board", uuid: favorite)
        }
    }

    init(firebaseStruct: [String: Any?]) {
        self.first = (firebaseStruct["first"] as! String)
        self.last = (firebaseStruct["last"] as! String)
        self.email = (firebaseStruct["email"] as! String)
        self.defaultBoardID = (firebaseStruct["defaultBoardID"] as! String)

        let boardList = firebaseStruct["boards"] as! [String: String]
        
        for (key, value) in boardList {
            
        }
        
    }
    
    
}
