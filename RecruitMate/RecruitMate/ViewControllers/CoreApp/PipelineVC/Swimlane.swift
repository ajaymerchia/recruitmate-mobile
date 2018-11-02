//
//  Swimlane.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/1/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

class Swimlane: UIView {

    static func == (lhs: Swimlane, rhs: Swimlane) -> Bool {
        return lhs.laneName.text == rhs.laneName.text
    }
    static func == (lhs: String, rhs: Swimlane) -> Bool {
        return lhs.uppercased() == rhs.laneName.text
    }
    static func == (lhs: Swimlane, rhs: String) -> Bool {
        return lhs.laneName.text == rhs.uppercased()
    }
    
    var name: String!
    var swimlaneParent: PipelineVC!
    var laneName: UILabel!
    var addJob: UIButton!

    init(frame: CGRect, name: String, swimlaneParent: PipelineVC) {
        super.init(frame: frame)
        self.name = name
        self.swimlaneParent = swimlaneParent
        initUI()
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
