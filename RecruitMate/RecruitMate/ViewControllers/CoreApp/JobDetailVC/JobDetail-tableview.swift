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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskCell
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        // Initialize Cell
        cell.awakeFromNib()
        cell.adjustViewWithHeight(cell.frame.height)
        cell.initializeCellFrom(job.tasks[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if deleteMode {
            debugPrint("Deleting task!")
            job.tasks.remove(at: indexPath.row)
            FirebaseAPIClient.push(job: job, toBoard: board, completion: {})
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
            selectedTask = job.tasks[indexPath.row]
            goToTaskDetail()
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

    }
}
