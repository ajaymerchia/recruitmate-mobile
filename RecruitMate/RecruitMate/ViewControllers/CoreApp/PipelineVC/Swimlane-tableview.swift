//
//  Swimlane-tableview.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/2/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension Swimlane: UITableViewDelegate, UITableViewDataSource {
    
    static let cellHeight:CGFloat = 120
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Swimlane.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCard") as! JobCard
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        // Initialize Cell
        cell.awakeFromNib()
        cell.initializeCellFrom(jobs[indexPath.row])
        cell.adjustViewWithHeight(Swimlane.cellHeight)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        swimlaneParent.jobForDetail = self.jobs[indexPath.row]
        swimlaneParent.performSegue(withIdentifier: "pipe2detail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}