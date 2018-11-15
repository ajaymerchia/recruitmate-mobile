//
//  JobDetail-system.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 10/20/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension JobDetailVC {
    
    @objc func goToEditJob() {
        self.performSegue(withIdentifier: "job2Edit", sender: self)
    }
    
    @objc func goToTaskDetail() {
        self.performSegue(withIdentifier: "detail2Task", sender: self)
    }
    
    @objc func goToNewTask() {
        self.performSegue(withIdentifier: "detail2NewTask", sender: self)
    }
    
    @objc func toggleDeleteMode() {
        if deleteMode {
            deleteMode = false
        } else {
            deleteMode = true
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? JobEditVC {
            vc.job = job
            vc.board = board
            // job = nil
        }
        
        if let vc = segue.destination as? TaskDetailVC {
            vc.board = board
            vc.job = job
            vc.task = selectedTask
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
}
