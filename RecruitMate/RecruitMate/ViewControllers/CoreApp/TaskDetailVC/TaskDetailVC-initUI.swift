//
//  TaskDetailVC-initUI.swift
//  RecruitMate
//
//  Created by Isabella Lau on 11/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

extension TaskDetailVC: UITextViewDelegate {
    
    func initHeader() {
        img = UIImageView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)! + Constants.PADDING , width: view.frame.width/5, height: view.frame.width/5))
        img.center = CGPoint(x: view.frame.width/2, y: img.frame.midY)
        img.image = job.companyLogo
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 0.5 * img.frame.width
        img.layer.borderWidth = 0.5
        img.layer.borderColor = rgba(162,162,162,1).cgColor
        view.addSubview(img)
        
        jobTitle = UILabel(frame: LayoutManager.belowCentered(elementAbove: img, padding: Constants.PADDING , width: view.frame.width, height: 35))
        jobTitle.textAlignment = .center
        jobTitle.text = job.companyName
        jobTitle.font = UIFont(name: "Avenir-Heavy", size: 35)
        view.addSubview(jobTitle)
        
        taskTitle = UILabel(frame: LayoutManager.belowCentered(elementAbove: jobTitle, padding: Constants.MARGINAL_PADDING , width: view.frame.width, height: 35))
        taskTitle.textAlignment = .center
        taskTitle.text = "Task: \(task.title!)"
        taskTitle.font = Constants.TEXT_FONT
        view.addSubview(taskTitle)
        
        let calendar = Calendar.current
        if task.deadline != nil {
            year = calendar.component(.year, from: task.deadline!)
            month = calendar.component(.month, from: task.deadline!)
            day = calendar.component(.day, from: task.deadline!)
        }
        
        taskDeadline = UILabel(frame: LayoutManager.belowCentered(elementAbove: taskTitle, padding: 0, width: view.frame.width, height: 30))
        taskDeadline.textAlignment = .center
        taskDeadline.text = "Due: \(month)/\(day)/\(year)"
        taskDeadline.font = Constants.TEXT_FONT?.italic
        view.addSubview(taskDeadline)
        
        datePicker = UIDatePicker(frame: LayoutManager.belowLeftX(elementAbove: taskTitle, padding: Constants.PADDING * 2, width: view.frame.width * 0.6, height: 75))
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.date = task.deadline ?? Date(timeIntervalSinceNow: TimeInterval(exactly: 0)!)
        
        taskDescription = UITextView(frame: LayoutManager.belowCentered(elementAbove: taskDeadline, padding: Constants.PADDING * 2, width: view.frame.width - 2 * Constants.PADDING, height: 50))
        taskDescription.isEditable = true
        taskDescription.delegate = self
        taskDescription.text = task.description ?? "Add task description here"
        taskDescription.font = Constants.TEXT_FONT
        
        if taskDescription.text == "Add task description here" {
            taskDescription.textColor = Constants.PLACEHOLDER_COLOR
            
        }
        view.addSubview(taskDescription)
        
        deadlineEditStartButton = UIButton(frame: LayoutManager.aboveRight(elementBelow: taskDescription, padding: Constants.PADDING * 2, width: 75, height: 25))
        deadlineEditStartButton.setBackgroundColor(color: job.companyColor?.darkerColor(percent: 0.4) ?? Constants.RECRUITMATE_BLUE, forState: .normal)
        deadlineEditStartButton.setTitle("Edit", for: .normal)
        deadlineEditStartButton.setTitleColor(.white, for: .normal)
        deadlineEditStartButton.clipsToBounds = true
        deadlineEditStartButton.layer.cornerRadius = deadlineEditStartButton.frame.width * 0.1
        deadlineEditStartButton.addTarget(self, action: #selector(deadlineEditStart), for: .touchUpInside)
        view.addSubview(deadlineEditStartButton)
        
        deadlineEditDoneButton = UIButton(frame: LayoutManager.aboveRight(elementBelow: taskDescription, padding: Constants.PADDING, width: 75, height: 25))
        deadlineEditDoneButton.setBackgroundColor(color: job.companyColor?.darkerColor(percent: 0.4) ?? Constants.RECRUITMATE_BLUE, forState: .normal)
        deadlineEditDoneButton.setTitle("Done", for: .normal)
        deadlineEditDoneButton.setTitleColor(.white, for: .normal)
        deadlineEditDoneButton.clipsToBounds = true
        deadlineEditDoneButton.layer.cornerRadius = deadlineEditDoneButton.frame.width * 0.1
        deadlineEditDoneButton.addTarget(self, action: #selector(deadlineEditDone), for: .touchUpInside)
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == Constants.PLACEHOLDER_COLOR {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Add task description here"
            textView.textColor = Constants.PLACEHOLDER_COLOR
        }
        
        if textView.text != task.description {
            task.description = textView.text
            FirebaseAPIClient.push(job: job, toBoard: board) {
                debugPrint("Task description updated")
            }
        }
    }

}
