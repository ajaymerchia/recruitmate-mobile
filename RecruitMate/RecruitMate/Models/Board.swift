//
//  Board.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/25/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation

class Board: Equatable {
    static func == (lhs: Board, rhs: Board) -> Bool {
        return lhs.id == rhs.id
    }
    
    var name: String!
    var id: String!
    var swimlanes:[String] = ["Wishlist", "Applied", "Coding Challenge", "Phone Screen", "Onsite Interview", "Offer", "Rejection"]
    var jobs: [Job] = []
    
    static let DEFAULT_BOARD = Board(title: "Random Board", uuid: "randomBoardsYeeet234")
    
    init(title: String, uuid: String) {
        name = title
        id = uuid
    }
    
    init(key: String, firebaseStruct: [String: Any?]) {
        id = key
        name = (firebaseStruct["title"] as! String)
        swimlanes = (firebaseStruct["swimlanes"] as! NSArray) as! [String]
        
        if let rawJobs = firebaseStruct["jobs"] as? NSDictionary as? [String: [String: Any?]] {
            for (jobID, jobData) in rawJobs {
                debugPrint(jobID, jobData)
                self.jobs.append(Job(key: jobID, firebaseStruct: jobData))
            }
        }
        
        
    }
    
    func addJob(_ job: Job) {
        jobs.append(job)
    }
    
    
    
}
