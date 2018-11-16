//
//  NewTaskVC-initUI.swift
//  RecruitMate
//
//  Created by Ajay Raj Merchia on 11/16/18.
//  Copyright © 2018 Ajay Raj Merchia. All rights reserved.
//

import Foundation
import UIKit

extension NewTaskVC: UITextViewDelegate {
    func initUI() {
        initNav()
        initHeader()
        initBody()
        
        initCompletion()
        
    }
    
    func initNav() {
        let navbar = UINavigationBar(frame: CGRect(x: 0, y: Constants.PADDING + 15, width: view.frame.width, height: 50));
        navbar.tintColor = Constants.RECRUITMATE_BLUE
        navbar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navbar.shadowImage = UIImage()
        navbar.isTranslucent = true
        
        self.view.addSubview(navbar)
        
        let navItem = UINavigationItem(title: "")
        let navBarbutton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop, target: self, action: #selector(goBack))
        navItem.leftBarButtonItem = navBarbutton
        
        navbar.items = [navItem]
    }
    
    func initHeader() {
        img = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width/4, height: view.frame.width/4))
        img.center = CGPoint(x: view.frame.width/2, y: view.frame.height/6)

        img.center = CGPoint(x: view.frame.width/2, y: img.frame.midY)
        img.image = job.companyLogo
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 0.5 * img.frame.width
        img.layer.borderWidth = 0.5
        img.layer.borderColor = rgba(162,162,162,1).cgColor
        view.addSubview(img)
        
        taskField = UITextField(frame: LayoutManager.belowCentered(elementAbove: img, padding: Constants.PADDING , width: view.frame.width, height: 40))
        taskField.placeholder = "Task Name"
        taskField.textAlignment = .center
        taskField.font = UIFont(name: "Avenir-Heavy", size: 35)
        view.addSubview(taskField)
        
        jobTitle = UILabel(frame: LayoutManager.belowCentered(elementAbove: taskField, padding: Constants.MARGINAL_PADDING , width: view.frame.width, height: 35))
        jobTitle.textAlignment = .center
        jobTitle.text = job.companyName
        if let pos = job.companyPosition {
            if pos != "" {
                jobTitle.text = "\(pos) @ \(job.companyName!)"
            }
        }
        jobTitle.font = Constants.TEXT_FONT
        view.addSubview(jobTitle)
    }
    
    func initBody() {
        
        
        datePicker = UIDatePicker(frame: LayoutManager.belowCentered(elementAbove: jobTitle, padding: Constants.PADDING, width: view.frame.width * 0.6, height: 100))
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.date = Date(timeIntervalSinceNow: TimeInterval(exactly: 0)!)
        view.addSubview(datePicker)
        
        
        taskDescription = UITextView(frame: LayoutManager.belowCentered(elementAbove: datePicker, padding: Constants.PADDING * 2, width: view.frame.width - 2 * Constants.PADDING, height: 150))
        taskDescription.isEditable = true
        taskDescription.delegate = self
        taskDescription.text = "Add task description here"
        taskDescription.font = Constants.TEXT_FONT
        taskDescription.textColor = Constants.PLACEHOLDER_COLOR

        view.addSubview(taskDescription)
        
        view.addSubview(Utils.getBorder(forView: taskDescription, thickness: 1, color: .black, side: .Top))
    }
    
    func initCompletion() {
        addTaskButton = UIButton(frame: LayoutManager.belowCentered(elementAbove: taskDescription, padding: Constants.PADDING*2, width: view.frame.width - 4 * Constants.PADDING, height: 50))
        addTaskButton.setBackgroundColor(color: Constants.RECRUITMATE_BLUE, forState: .normal)
        addTaskButton.setBackgroundColor(color: Constants.RECRUITMATE_BLUE_DARK, forState: .highlighted)
        
        addTaskButton.setTitle("Add Task", for: .normal)
        addTaskButton.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        
        view.addSubview(addTaskButton)
        
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == Constants.PLACEHOLDER_COLOR {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = "Add task description here"
            textView.textColor = Constants.PLACEHOLDER_COLOR
        }
        
    }
}
