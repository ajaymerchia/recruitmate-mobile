//
//  JobDetail-tableview.swift
//  RecruitMate
//
//  Created by Isabella Lau on 11/10/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

extension JobDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return job.tasks.count
    }
    
    static let ROW_HEIGHT = Constants.PADDING*2 + 30
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return JobDetailVC.ROW_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskCell
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        // Initialize Cell
        cell.awakeFromNib()
        cell.adjustViewWithHeight(JobDetailVC.ROW_HEIGHT)
        cell.initializeCellFrom(job.tasks[indexPath.row])
        cell.backgroundColor = nil
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedTask = job.tasks[indexPath.row]
        goToTaskDetail()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

    }
}
