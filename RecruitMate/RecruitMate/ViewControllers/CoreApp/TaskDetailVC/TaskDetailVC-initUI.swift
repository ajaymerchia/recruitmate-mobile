//
//  TaskDetailVC-initUI.swift
//  RecruitMate
//
//  Created by Isabella Lau on 11/14/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import UIKit

extension TaskDetailVC: UITextViewDelegate {
    
    func initUI() {
        initNav()
        initHeader()
        initBody()
        
    }
    
    func initNav() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(startEditingTask))

        self.title = task.title
        
    }
    
    
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
        
        jobTitle = UILabel(frame: LayoutManager.belowCentered(elementAbove: img, padding: Constants.PADDING , width: view.frame.width, height: 40))
        jobTitle.textAlignment = .center
        jobTitle.text = task.title
        jobTitle.font = UIFont(name: "Avenir-Heavy", size: 35)
        view.addSubview(jobTitle)
        
        taskTitle = UILabel(frame: LayoutManager.belowCentered(elementAbove: jobTitle, padding: Constants.MARGINAL_PADDING , width: view.frame.width, height: 35))
        taskTitle.textAlignment = .center
        taskTitle.text = job.companyName
        if let pos = job.companyPosition {
            if pos != "" {
                taskTitle.text = "\(pos) @ \(job.companyName!)"
            }
        }
        taskTitle.font = Constants.TEXT_FONT
        view.addSubview(taskTitle)
        
        
        
        taskDeadline = UILabel(frame: LayoutManager.belowCentered(elementAbove: taskTitle, padding: 0, width: view.frame.width, height: 30))
        taskDeadline.textAlignment = .center
        taskDeadline.font = Constants.TEXT_FONT?.italic
        updateDeadline()
        view.addSubview(taskDeadline)
    }
    
    func initBody() {
        taskDescription = UITextView(frame: LayoutManager.belowCentered(elementAbove: taskDeadline, padding: Constants.PADDING * 2, width: view.frame.width - 2 * Constants.PADDING, height: 250))
        taskDescription.isEditable = true
        taskDescription.delegate = self
        taskDescription.text = task.description ?? "Add task description here"
        taskDescription.font = Constants.TEXT_FONT
        taskDescription.showsVerticalScrollIndicator = true
        taskDescription.isScrollEnabled = true
        
        if taskDescription.text == "Add task description here" {
            taskDescription.textColor = Constants.PLACEHOLDER_COLOR
            
        }
        view.addSubview(taskDescription)
        
        view.addSubview(Utils.getBorder(forView: taskDescription, thickness: 1, color: .black, side: .Top))
        
        datePicker = UIDatePicker(frame: LayoutManager.between(elementAbove: taskTitle, elementBelow: taskDescription, width: view.frame.width * 0.6, topPadding: Constants.MARGINAL_PADDING, bottomPadding: Constants.MARGINAL_PADDING))
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.date = task.deadline ?? Date(timeIntervalSinceNow: TimeInterval(exactly: 0)!)
        datePicker.isUserInteractionEnabled = false
        datePicker.alpha = 0
        view.addSubview(datePicker)
    }
    
    func updateDeadline() {
        let calendar = Calendar.current
        if task.deadline != nil {
            year = calendar.component(.year, from: task.deadline!)
            month = calendar.component(.month, from: task.deadline!)
            day = calendar.component(.day, from: task.deadline!)
        }
        taskDeadline.text = "Due: \(month)/\(day)/\(year)"

    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == Constants.PLACEHOLDER_COLOR {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
        if inEditMode == false {
            startEditingTask()
        }
        
        inEditMode = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = "Add task description here"
            textView.textColor = Constants.PLACEHOLDER_COLOR
        }
        
        if inEditMode {
            endEditingTask()
        }
        
        inEditMode = false
        
        
    }

}
