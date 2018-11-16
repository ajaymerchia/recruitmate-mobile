//
//  TaskDetailVC-logic.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/16/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension TaskDetailVC {
    @objc func startEditingTask() {
        isEditing = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(endEditingTask))
        
        datePicker.isUserInteractionEnabled = true
        taskDescription.becomeFirstResponder()
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            self.datePicker.alpha = 1
            self.taskDeadline.alpha = 0
        }, completion: nil)
        
    }
    
    @objc func endEditingTask() {
        isEditing = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(startEditingTask))
        
        datePicker.isUserInteractionEnabled = false
        taskDescription.resignFirstResponder()
        
        if task.deadline != datePicker.date {
            task.deadline = datePicker.date
            if taskDescription.text != task.description {
                task.description = taskDescription.text
            }
            updateDeadline()
            FirebaseAPIClient.push(job: job, toBoard: board) {
                debugPrint("Task deadline updated")
            }
            
        }
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            self.datePicker.alpha = 0
            self.taskDeadline.alpha = 1
        }, completion: nil)
        
    }
}
