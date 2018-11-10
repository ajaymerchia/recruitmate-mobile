//
//  Pipeline-logic.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/2/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension PipelineVC {
    func initData() {
        board = (self.tabBarController as! TabBarController).currentBoard
        swimlaneNames = board.swimlanes
        
        for name in swimlaneNames {
            cards[name] = []
        }
        
        for job in board.jobs {
            cards[job.pipelineStatus]!.append(job)
        }
    }
}
