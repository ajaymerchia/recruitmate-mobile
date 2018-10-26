//
//  Board.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/25/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import SwiftyJSON
class Board: Equatable {
    static func == (lhs: Board, rhs: Board) -> Bool {
        return lhs.id == rhs.id
    }
    
    var name: String!
    var id: String!
    var jobs: [Job] = []
    
    init(title: String, uuid: String) {
        name = title
        id = uuid
    }
    
    init(firebaseRecord: JSON) {
        //TODO: Implement JSON -> Job arrya parser
    }
    
    func addJob(_ job: Job) {
        jobs.append(job)
    }
    
    
    
}
