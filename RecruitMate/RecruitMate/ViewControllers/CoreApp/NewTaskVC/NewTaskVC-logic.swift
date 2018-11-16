//
//  NewTaskVC-logic.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/16/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension NewTaskVC {
    @objc func addTask() {
        addTaskButton.isUserInteractionEnabled = false
        hud = alerts.startProgressHud(withMsg: "Adding Task")

        guard let tit = taskField.text else {
            alerts.displayAlert(title: "Oops!", message: "Please enter a Task Name")
            return
        }
        
        if tit == "" {
            alerts.displayAlert(title: "Oops!", message: "Please enter a Task Name")
            return

        }
        
        guard let desc = taskDescription.text else {
            alerts.displayAlert(title: "Oops!", message: "We had an internal error.")
            return
        }
        
        if desc == "Add task description here" {
            job.addTask(Task(title: tit, description: nil, deadline: datePicker.date))
        } else {
            job.addTask(Task(title: tit, description: desc, deadline: datePicker.date))
        }

        
        FirebaseAPIClient.push(job: job, toBoard: board) {
            self.refreshMe?.tableView.reloadData()
            self.dismiss(animated: true, completion: {})
        }
        
        
    }
}
