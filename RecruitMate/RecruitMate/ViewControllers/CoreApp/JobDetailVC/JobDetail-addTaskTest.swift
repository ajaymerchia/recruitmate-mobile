//
//  JobDetail-addTaskTest.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/10/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit
extension JobDetailVC {
    func initQuickTaskAdder() {
        task = UITextField(frame: LayoutManager.belowCentered(elementAbove: companyPosition, padding: Constants.PADDING, width: view.frame.width, height: 40))
        task.placeholder = "task title"
        task.textAlignment = .center
        view.addSubview(task)
        
        desc = UITextField(frame: LayoutManager.belowCentered(elementAbove: task, padding: Constants.PADDING, width: view.frame.width, height: 40))
        desc.placeholder = "task description"
        desc.textAlignment = .center
        view.addSubview(desc)
        
        date = UIDatePicker(frame: LayoutManager.belowCentered(elementAbove: desc, padding: Constants.PADDING, width: view.frame.width, height: 40))
        view.addSubview(date)
        
        let but = UIButton(frame: LayoutManager.belowCentered(elementAbove: date, padding: Constants.PADDING, width: view.frame.width/4, height: 50))
        but.setTitle("AddTask", for: .normal)
        but.setTitleColor(Constants.RECRUITMATE_BLUE, for: .normal)
        but.addTarget(self, action: #selector(testMakeTask), for: .touchUpInside)
        view.addSubview(but)
        
    }
    
    @objc func testMakeTask() {
        job.addTask(Task(title: task.text!, description: desc.text!, deadline: date.date))
        FirebaseAPIClient.push(job: job, toBoard: board) {
            print("Pushed task to the board")
        }
    }
}
