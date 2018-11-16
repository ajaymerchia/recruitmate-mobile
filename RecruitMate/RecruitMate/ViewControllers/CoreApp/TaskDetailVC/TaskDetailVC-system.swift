//
//  TaskDetailVC-system.swift
//  RecruitMate
//
//  Created by Isabella Lau on 11/15/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

import Foundation
import UIKit

extension TaskDetailVC {
    @objc func deadlineEditStart() {
        // Remove text field and start
        taskDeadline.removeFromSuperview()
        deadlineEditStartButton.removeFromSuperview()

        // Add date picker
        view.addSubview(datePicker)
        
        // Done button
        view.addSubview(deadlineEditDoneButton)
    }
    
    @objc func deadlineEditDone() {
        // Add text field and start
        view.addSubview(taskDeadline)
        view.addSubview(deadlineEditStartButton)

        // Remove date picker
        datePicker.removeFromSuperview()
        
        // Done button
        deadlineEditDoneButton.removeFromSuperview()
        
        // Update date if changed
        if task.deadline != datePicker.date {
            task.deadline = datePicker.date
            FirebaseAPIClient.push(job: job, toBoard: board) {
                debugPrint("Task description updated")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
}
